// import 'package:fpdart/fpdart.dart';
// import 'package:resumewithus/core/error/exception.dart';
// import 'package:resumewithus/core/error/failures.dart';
// import 'package:resumewithus/features/auth/data/remote_data_source/auth_firebase_datasource.dart';
// import 'package:resumewithus/features/auth/domain/entity/user.dart';
// import 'package:resumewithus/features/auth/domain/repository/auth_repository.dart';
// import 'package:resumewithus/features/auth/data/model/user_model.dart';

// class AuthRepositoryImpl implements AuthRepository {
//   final AuthFirebaseDatasource _datasource;
//   AuthRepositoryImpl(this._datasource);

//   @override
//   Future<Either<Failures, User>> signIn({
//     required String email,
//     required String password,
//   }) async {
//     return _getUser(
//       () => _datasource.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       ),
//     );
//   }

//   @override
//   Future<Either<Failures, User>> signUp({
//     required String name,
//     required String email,
//     required String password,
//   }) async {
//     return _getUser(
//       () => _datasource.signUpWithEmailAndPassword(
//         name: name,
//         email: email,
//         password: password,
//       ),
//     );
//   }

//   Future<Either<Failures, User>> _getUser(
//       Future<UserModel> Function() fn) async {
//     try {
//       final user = await fn();
//       return right(user);
//     } on ServerException catch (e) {
//       return left(Failures(e.message));
//     }
//   }

//   @override
//   Stream<User?> get authStateChanges => throw UnimplementedError();
// }
import 'package:fpdart/fpdart.dart';
import 'package:resumewithus/core/error/exception.dart';
import 'package:resumewithus/core/error/failures.dart';
import 'package:resumewithus/features/auth/domain/entity/user.dart';
import 'package:resumewithus/features/auth/data/remote_data_source/auth_firebase_datasource.dart';
import 'package:resumewithus/features/auth/data/model/user_model.dart';
import 'package:resumewithus/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthFirebaseDatasource _datasource;
  AuthRepositoryImpl(this._datasource);

  @override
  Future<Either<Failures, User>> signIn({
    required String email,
    required String password,
  }) async {
    return _getUser(
      () => _datasource.signInWithEmailAndPassword(
        email: email,
        password: password,
      ),
    );
  }

  @override
  Future<Either<Failures, User>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    return _getUser(
      () => _datasource.signUpWithEmailAndPassword(
        name: name,
        email: email,
        password: password,
      ),
    );
  }

  Future<Either<Failures, User>> _getUser(
      Future<UserModel> Function() fn) async {
    try {
      final userModel = await fn();
      final user = _mapUserModelToUser(userModel);
      return right(user);
    } on ServerException catch (e) {
      return left(Failures(e.message));
    }
  }

  User _mapUserModelToUser(UserModel model) {
    return User(
      userId: model.userId,
      email: model.email,
      name: model.name,
    );
  }

  @override
  Stream<User?> get authStateChanges {
    return _datasource.authStateChanges.map((userModel) {
      return userModel != null ? _mapUserModelToUser(userModel) : null;
    });
  }
}
