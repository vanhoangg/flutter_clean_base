import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../entity/model.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class HomeUseCase extends BaseUseCase<void, HomeObjectEntity> {
  final Repository _repository;

  HomeUseCase(this._repository);

  @override
  Future<Either<Failure, HomeObjectEntity>> execute(void input) async {
    return await _repository.getHome();
  }
}
