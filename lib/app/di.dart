import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/data_source/local_data_source.dart';
import '../data/data_source/remote_data_source.dart';
import '../data/network/app_api.dart';
import '../data/network/dio_factory.dart';
import '../data/network/network_info.dart';
import '../data/repository/repository_impl.dart';
import '../domain/repository/repository.dart';
import '../domain/usecase/forgot_password_usecase.dart';
import '../domain/usecase/home_usecase.dart';
import '../domain/usecase/login_usecase.dart';
import '../domain/usecase/register_usecase.dart';
import '../domain/usecase/store_details_usecase.dart';
import '../presentation/forgot_password/forgot_password_viewmodel.dart';
import '../presentation/login/login_viewmodel.dart';
import '../presentation/main/home/home_viewmodel.dart';
import '../presentation/register/register_viewmodel.dart';
import '../presentation/store_details/bloc/store_details_bloc.dart';

import 'app_prefs.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // shared prefs instance
  final sharedPrefs = await SharedPreferences.getInstance();

  // network info
  final connectivityResult = await Connectivity().checkConnectivity();

  // app  service client
  final dio = await instance<DioFactory>().getDio();

  instance
    ..registerLazySingleton<SharedPreferences>(() => sharedPrefs)

    // app prefs instance
    ..registerLazySingleton<AppPreferences>(() => AppPreferences(instance()))
    ..registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImpl(connectivityResult))

    // dio factory
    ..registerLazySingleton<DioFactory>(() => DioFactory(instance()))
    ..registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio))

    // remote data source
    ..registerLazySingleton<RemoteDataSource>(
        () => RemoteDataSourceImplementer(instance()))

    // local data source
    ..registerLazySingleton<LocalDataSource>(() => LocalDataSourceImplementer())

    // repository
    ..registerLazySingleton<Repository>(
        () => RepositoryImpl(instance(), instance(), instance()));
}

void initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}

void initForgotPasswordModule() {
  if (!GetIt.I.isRegistered<ForgotPasswordUseCase>()) {
    instance.registerFactory<ForgotPasswordUseCase>(
        () => ForgotPasswordUseCase(instance()));
    instance.registerFactory<ForgotPasswordViewModel>(
        () => ForgotPasswordViewModel(instance()));
  }
}

void initRegisterModule() {
  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    instance
        .registerFactory<RegisterUseCase>(() => RegisterUseCase(instance()));
    instance.registerFactory<RegisterViewModel>(
        () => RegisterViewModel(instance()));
    instance.registerFactory<ImagePicker>(() => ImagePicker());
  }
}

void initHomeModule() {
  if (!GetIt.I.isRegistered<HomeUseCase>()) {
    instance
      ..registerFactory<HomeUseCase>(() => HomeUseCase(instance()))
      ..registerFactory<HomeViewModel>(() => HomeViewModel(instance()));
  }
}

void initStoreDetailsModule() {
  if (!GetIt.I.isRegistered<StoreDetailsUseCase>()) {
    instance
      ..registerFactory<StoreDetailsUseCase>(
          () => StoreDetailsUseCase(instance()))
      ..registerFactory<StoreDetailsBloc>(() => StoreDetailsBloc(instance()));
  }
}

void resetModules() {
  instance.reset(dispose: false);
  initAppModule();
  initHomeModule();
  initLoginModule();
  initRegisterModule();
  initForgotPasswordModule();
  initStoreDetailsModule();
}
