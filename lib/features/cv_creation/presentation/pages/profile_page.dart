import 'package:flutter/material.dart';
import 'package:resumewithus/features/cv_creation/presentation/widgets/special_appbar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: specialappbar(appbarName: 'Profile'),
    );
  }
}
