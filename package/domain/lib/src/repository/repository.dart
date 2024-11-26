import 'package:dartz/dartz.dart';
import 'package:shared/shared.dart';

import '../entity/entity.dart';

abstract class Repository {
  Future<Either<Failure, UserEntity>> login(String username, String password);
}
