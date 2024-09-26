// import 'package:resumewithus/features/auth/domain/entity/user.dart';

// class UserModel extends User {
//   UserModel({
//     required super.userId,
//     required super.email,
//     required super.name,
//   });

//   factory UserModel.fromJson(Map<String, dynamic> map) {
//     return UserModel(
//       userId: map['userId'] ?? '',
//       email: map['email'] ?? '',
//       name: map['name'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'userId': userId,
//       'email': email,
//       'name': name,
//     };
//   }
// }
import 'package:resumewithus/features/auth/domain/entity/user.dart';

class UserModel extends User {
  UserModel({
    required super.userId,
    required super.email,
    required super.name,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    final userId = map['userId'] as String?;
    final email = map['email'] as String?;
    final name = map['name'] as String?;

    if (userId == null || email == null || name == null) {
      throw ArgumentError('Invalid JSON data');
    }

    return UserModel(
      userId: userId,
      email: email,
      name: name,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
    };
  }
}
