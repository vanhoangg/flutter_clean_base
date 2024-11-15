import 'package:dartz/dartz.dart';

import '../../app/functions.dart';
import '../../data/network/failure.dart';
import '../../data/request/request.dart';
import '../entity/model.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class LoginUseCase
    implements BaseUseCase<LoginUseCaseInput, AuthenticationEntity> {
  final Repository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, AuthenticationEntity>> execute(
      LoginUseCaseInput input) async {
    final DeviceInfoEntity deviceInfo = await getDeviceDetails();
    return await _repository.login(LoginRequest(
        input.email, input.password, deviceInfo.identifier, deviceInfo.name));
  }
}

class LoginUseCaseInput {
  String email;
  String password;

  LoginUseCaseInput(this.email, this.password);
}
