import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';

import '../entity/store_details_entity.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class StoreDetailsUseCase
    extends BaseUseCase<StoreDetailsUseCaseInput, StoreDetailsEntity> {
  Repository repository;

  StoreDetailsUseCase(this.repository);

  @override
  Future<Either<Failure, StoreDetailsEntity>> execute(
      StoreDetailsUseCaseInput input) {
    return repository.getStoreDetails();
  }
}

class StoreDetailsUseCaseInput {
  const StoreDetailsUseCaseInput();
}
