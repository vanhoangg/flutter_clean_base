import 'package:dartz/dartz.dart';
import 'package:shared/shared.dart';

import '../entity/authentication/user_entity.dart';

abstract class Repository {
  Future<Either<Failure, UserEntity>> login(String username, String password);
  Future<Either<Failure, List<UserEntity>>> getListUser();
  Future<Either<Failure, List<UserEntity>>> getSearchListUser(
      {required String searchParams});
  Future<Either<Failure, List<UserEntity>>> getFilterListUser(
      {required String queryKey, required String value});

  Future<Either<Failure, UserEntity>> getUserProfile({required String userId});
  Future<Either<Failure, UserEntity>> updateUserProfile(
      {required String userId, required Map<String, dynamic> body});
}
