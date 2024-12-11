import 'package:dartz/dartz.dart';

import 'package:domain/domain.dart';
import 'package:shared/shared.dart';

import '../network/data_source/auth_data_source.dart';
import '../local/data_source/local_data_source.dart';
import '../network/data_source/user_data_source.dart';

import '../network/mapper/user/user_mapper.dart';
import '../network/model/request/login_request.dart';
import '../network/client/base/error_handler.dart';

class RepositoryImpl extends Repository {
  final AuthDataSource _authDataSource;
  // ignore: unused_field
  final LocalDataSource _localDataSource;
  final UserDataSource _userDataSource;

  RepositoryImpl(
    this._authDataSource,
    this._localDataSource,
    this._userDataSource,
  );

  @override
  Future<Either<Failure, UserEntity>> login(
      String username, String password) async {
    try {
      // its safe to call the API
      final response =
          await _authDataSource.login(LoginRequest(username, password));
      final result = response?.data?.toDomain() ?? UserEntity.emptyObject();

      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<UserEntity>>> getFilterListUser(
      {required String queryKey, required String value}) async {
    try {
      // its safe to call the API
      final response = await _userDataSource.getFilterListUser(
          queryKey: queryKey, value: value);
      final result = response?.items
              ?.map((e) => e?.toDomain() ?? UserEntity.emptyObject())
              .toList() ??
          [];
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<UserEntity>>> getListUser() async {
    try {
      // its safe to call the API
      final response = await _userDataSource.getListUser();
      final result = response?.items
              ?.map((e) => e?.toDomain() ?? UserEntity.emptyObject())
              .toList() ??
          [];
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<UserEntity>>> getSearchListUser(
      {required String searchParams}) async {
    try {
      // its safe to call the API
      final response =
          await _userDataSource.getSearchListUser(searchParams: searchParams);
      final result = response?.items
              ?.map((e) => e?.toDomain() ?? UserEntity.emptyObject())
              .toList() ??
          [];
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUserProfile(
      {required String userId}) async {
    try {
      // its safe to call the API
      final response = await _userDataSource.getUserProfile(userId: userId);
      return Right(response?.toDomain() ?? UserEntity.emptyObject());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, UserEntity>> updateUserProfile(
      {required String userId, required Map<String, dynamic> body}) async {
    try {
      // its safe to call the API
      final response =
          await _userDataSource.updateUserProfile(userId: userId, body: body);
      return Right(response?.toDomain() ?? UserEntity.emptyObject());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
