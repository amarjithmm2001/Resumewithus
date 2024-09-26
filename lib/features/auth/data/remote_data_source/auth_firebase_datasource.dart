// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:resumewithus/core/error/exception.dart';
// import 'package:resumewithus/features/auth/data/model/user_model.dart';

// abstract class AuthFirebaseDatasource {
//   Future<UserModel> signUpWithEmailAndPassword({
//     required String name,
//     required String email,
//     required String password,
//   });

//   Future<UserModel> signInWithEmailAndPassword({
//     required String email,
//     required String password,
//   });
// }

// class AuthFirebaseDatasourceImpl implements AuthFirebaseDatasource {
//   final FirebaseAuth _auth;
//   final FirebaseFirestore _data;

//   AuthFirebaseDatasourceImpl(
//     this._auth,
//     this._data,
//   );

//   @override
//   Future<UserModel> signInWithEmailAndPassword({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       User? user = userCredential.user;

//       if (user == null) {
//         throw ServerException('User is null');
//       }

//       return UserModel(
//         userId: user.uid,
//         email: user.email ?? '',
//         name: user.displayName ?? '',
//       );
//     } catch (e) {
//       throw ServerException(e.toString());
//     }
//   }

//   @override
//   Future<UserModel> signUpWithEmailAndPassword({
//     required String name,
//     required String email,
//     required String password,
//   }) async {
//     try {
//       UserCredential userCredential =
//           await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       User? user = userCredential.user;

//       if (user == null) {
//         throw ServerException('User is null');
//       }

//       await _data.collection("users").doc(user.uid).set({
//         "Name": name,
//         "Email": email,
//         "CreatedAt": DateTime.now(),
//       });

//       return UserModel(
//         userId: user.uid,
//         email: user.email ?? '',
//         name: name,
//       );
//     } catch (e) {
//       throw ServerException(e.toString());
//     }
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:resumewithus/core/error/exception.dart';
import 'package:resumewithus/features/auth/data/model/user_model.dart';

abstract class AuthFirebaseDatasource {
  Future<UserModel> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Stream<UserModel?> get authStateChanges;
}

class AuthFirebaseDatasourceImpl implements AuthFirebaseDatasource {
  final FirebaseAuth _auth;
  final FirebaseFirestore _data;

  AuthFirebaseDatasourceImpl(
    this._auth,
    this._data,
  );

  @override
  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;

      if (user == null) {
        throw ServerException('User is null');
      }

      return UserModel(
        userId: user.uid,
        email: user.email ?? '',
        name: user.displayName ?? '',
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;

      if (user == null) {
        throw ServerException('User is null');
      }

      await _data.collection("users").doc(user.uid).set({
        "Name": name,
        "Email": email,
        "CreatedAt": DateTime.now(),
      });

      return UserModel(
        userId: user.uid,
        email: user.email ?? '',
        name: name,
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Stream<UserModel?> get authStateChanges =>
      _auth.authStateChanges().map((user) {
        if (user == null) {
          return null;
        }
        return UserModel(
          userId: user.uid,
          email: user.email ?? '',
          name: user.displayName ?? '',
        );
      });
}
