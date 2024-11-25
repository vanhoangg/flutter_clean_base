import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/data_source/authentication/auth_data_source.dart';
import '../data/data_source/local/local_data_source.dart';
import '../data/network/authentication/auth_api_service.dart';
import '../data/network/dio_factory.dart';
import '../data/network/network_info.dart';
import '../data/repository/repository_impl.dart';
import '../domain/repository/repository.dart';
import '../domain/usecase/login_usecase.dart';
import '../presentation/login/bloc/login_bloc.dart';

import '../shared/util/widget/widget_util.dart';
import 'app_prefs.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // shared prefs instance
  final sharedPrefs = await SharedPreferences.getInstance();

  // network info
  final connectivityResult = await Connectivity().checkConnectivity();

  // app  service client

  instance
    ..registerLazySingleton<SharedPreferences>(() => sharedPrefs)

    // app prefs instance
    ..registerLazySingleton<AppPreferences>(() => AppPreferences(instance()))
    ..registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImpl(connectivityResult))

    // dio factory
    ..registerLazySingleton<DioFactory>(() => DioFactory(instance()))
    ..registerLazySingleton<WidgetUtil>(() => WidgetUtil());

  final dio = await instance<DioFactory>().getDio();

  instance
    ..registerLazySingleton<AuthServiceClient>(() => AuthServiceClient(dio))

    // remote data source
    ..registerLazySingleton<AuthDataSource>(
        () => AuthDataSourceImplementer(instance()))

    // local data source
    ..registerLazySingleton<LocalDataSource>(() => LocalDataSourceImplementer())

    // repository
    ..registerLazySingleton<Repository>(
        () => RepositoryImpl(instance(), instance(), instance()));
}

void initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginBloc>(() => LoginBloc(instance()));
  }
}

void resetModules() {
  instance.reset(dispose: false);
  initAppModule();
  initLoginModule();
}
