import 'package:dartz/dartz.dart';

import '../../app/app_prefs.dart';
import '../../app/di.dart';
import '../../app/extensions.dart';
import '../../domain/entity/entity.dart';
import '../../domain/repository/repository.dart';

import '../data_source/authentication/auth_data_source.dart';
import '../data_source/local/local_data_source.dart';

import '../mapper/authentication/authentication_mapper.dart';
import '../model/request/login_request.dart';
import '../network/error_handler.dart';
import '../network/failure.dart';
import '../network/network_info.dart';

class RepositoryImpl extends Repository {
  final AuthDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;
  final _appPreferences = instance<AppPreferences>();

  RepositoryImpl(
      this._remoteDataSource, this._localDataSource, this._networkInfo);

  @override
  Future<Either<Failure, UserEntity>> login(LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        // its safe to call the API
        final response = await _remoteDataSource.login(loginRequest);
        if (response.accessToken != null) {
          await Future.wait([
            _appPreferences
                .setUserToken(response.accessToken?.orEmpty() ?? EMPTY),
            _appPreferences.setIsUserLoggedIn(),
            resetModules(),
          ]);
        }

        return Right(response.toDomain());
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // return connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
