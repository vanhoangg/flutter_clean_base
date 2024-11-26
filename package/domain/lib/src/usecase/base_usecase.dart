import 'package:dartz/dartz.dart';
import 'package:shared/shared.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}
