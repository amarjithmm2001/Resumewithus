import 'package:fpdart/fpdart.dart';
import 'package:resumewithus/core/error/failures.dart';
import 'package:resumewithus/core/usecase/usecase.dart';
import 'package:resumewithus/features/auth/domain/entity/user.dart';
import 'package:resumewithus/features/auth/domain/repository/auth_repository.dart';

class SignupUsecase implements Usecase<User, UserSignUpParameters> {
  final AuthRepository _authRepository;
  SignupUsecase(this._authRepository);

  @override
  Future<Either<Failures, User>> call(UserSignUpParameters parameter) async {
    if (parameter.name.isEmpty ||
        parameter.email.isEmpty ||
        parameter.password.isEmpty) {
      return left(Failures('Invalid input data'));
    }

    return await _authRepository.signUp(
      name: parameter.name,
      email: parameter.email,
      password: parameter.password,
    );
  }
}

class UserSignUpParameters {
  final String name;
  final String email;
  final String password;

  UserSignUpParameters({
    required this.name,
    required this.email,
    required this.password,
  });
}
