import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';
import 'package:shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../presentation/login/bloc/login_bloc.dart';

import 'widget_util.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // shared prefs instance
  final sharedPrefs = await SharedPreferences.getInstance();
  final _appInfo = AppInfo();
  await _appInfo.init();
  // app  service client

  instance
    ..registerLazySingleton<SharedPreferences>(() => sharedPrefs)
    // app info
    ..registerLazySingleton<AppInfo>(() => _appInfo)
    // app prefs instance
    ..registerLazySingleton<AppPreferences>(
      () => AppPreferences(instance()),
    )
    // dio factory
    ..registerLazySingleton<WidgetUtil>(() => WidgetUtil())
    ..registerLazySingleton<AccessTokenInterceptor>(
      () => AccessTokenInterceptor(instance()),
    )
    ..registerLazySingleton<HeaderInterceptor>(
      () => HeaderInterceptor(instance()),
    )
    ..registerLazySingleton<AuthAppServerApiClient>(
      () => AuthAppServerApiClient(instance(), instance()),
    )
    // remote data source
    ..registerLazySingleton<AuthDataSource>(
      () => AuthDataSourceImplementer(instance()),
    )
    // local data source
    ..registerLazySingleton<LocalDataSource>(() => LocalDataSourceImplementer())
    ..registerLazySingleton<UserDataSource>(
        () => UserDataSourceImplementer(instance()))

    // repository
    ..registerLazySingleton<Repository>(
      () => RepositoryImpl(instance(), instance(), instance()),
    );
}

void initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginBloc>(() => LoginBloc(instance()));
  }
}

Future<void> resetModules() async {
  await instance.reset(dispose: false);
  await initAppModule();
  initLoginModule();
}
