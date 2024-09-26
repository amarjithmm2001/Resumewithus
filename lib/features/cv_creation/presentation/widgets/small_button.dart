import 'package:flutter/material.dart';
import 'package:resumewithus/core/theme/my_app_colors.dart';

class SmallButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;

  const SmallButton({
    super.key,
    required this.buttonText,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      width: 220.0,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: Center(
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 16.0,
            color: MyAppColors.textdarkmodeColor,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}
