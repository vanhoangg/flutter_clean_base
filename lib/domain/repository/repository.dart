import 'package:dartz/dartz.dart';

import '../../data/model/request/login_request.dart';
import '../../data/network/failure.dart';
import '../entity/entity.dart';

abstract class Repository {
  Future<Either<Failure, UserEntity>> login(LoginRequest loginRequest);
}
