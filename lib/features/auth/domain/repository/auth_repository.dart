import 'package:fpdart/fpdart.dart';
import 'package:resumewithus/core/error/failures.dart';
import 'package:resumewithus/features/auth/domain/entity/user.dart';

abstract interface class AuthRepository {
  Future<Either<Failures, User>> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failures, User>> signIn({
    required String email,
    required String password,
  });
  Stream<User?> get authStateChanges;
}
