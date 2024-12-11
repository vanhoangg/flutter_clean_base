import 'package:dartz/dartz.dart';
import 'package:shared/shared.dart';

import '../entity/authentication/user_entity.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, UserEntity> {
  final Repository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, UserEntity>> execute(LoginUseCaseInput input) async {
    // final DeviceInfo deviceInfo = await getDeviceDetails();
    return await _repository.login(
      input.username,
      input.password,
    );
  }
}

class LoginUseCaseInput {
  String username;
  String password;

  LoginUseCaseInput(this.username, this.password);
}
