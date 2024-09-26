import 'package:fpdart/fpdart.dart';
import 'package:resumewithus/core/error/failures.dart';

abstract interface class Usecase<SuccessType, Parameter> {
  Future<Either<Failures, SuccessType>> call(Parameter parameter);
}
