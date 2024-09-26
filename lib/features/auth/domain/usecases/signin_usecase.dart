import 'package:fpdart/fpdart.dart';
import 'package:resumewithus/core/error/failures.dart';
import 'package:resumewithus/core/usecase/usecase.dart';
import 'package:resumewithus/features/auth/domain/entity/user.dart';
import 'package:resumewithus/features/auth/domain/repository/auth_repository.dart';

class SigninUsecase implements Usecase<User, UserSigInParameters> {
  final AuthRepository _authRepository;
  SigninUsecase(this._authRepository);
  @override
  Future<Either<Failures, User>> call(parameter) async {
    return await _authRepository.signIn(
      email: parameter.email,
      password: parameter.password,
    );
  }
}

class UserSigInParameters {
  final String email;
  final String password;

  UserSigInParameters({
    required this.email,
    required this.password,
  });
}
