import 'package:dartz/dartz.dart';

import 'package:domain/domain.dart';
import 'package:shared/shared.dart';

import '../data_source/authentication/auth_data_source.dart';
import '../data_source/local/local_data_source.dart';
import '../mapper/user/user_mapper.dart';
import '../model/request/login_request.dart';
import '../network/error_handler.dart';
import '../network/network_info.dart';

class RepositoryImpl extends Repository {
  final AuthDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(
      this._remoteDataSource, this._localDataSource, this._networkInfo);

  @override
  Future<Either<Failure, UserEntity>> login(
      String username, String password) async {
    if (await _networkInfo.isConnected) {
      try {
        // its safe to call the API
        final response =
            await _remoteDataSource.login(LoginRequest(username, password));

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
