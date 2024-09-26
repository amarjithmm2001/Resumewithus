import 'package:flutter/material.dart';
import 'package:resumewithus/core/theme/my_app_colors.dart';

class SignupLoginButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  const SignupLoginButton({
    super.key,
    required this.buttonText,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      width: double.infinity,
      color: buttonColor,
      child: Center(
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 20.0,
            color: MyAppColors.textdarkmodeColor,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}
