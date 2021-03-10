import 'package:dartz/dartz.dart';
import 'package:dunija/core/failures/failures.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
