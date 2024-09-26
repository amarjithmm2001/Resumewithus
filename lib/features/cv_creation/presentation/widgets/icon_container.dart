import 'package:flutter/material.dart';
import 'package:resumewithus/core/theme/my_app_colors.dart';

class IconContainer extends StatelessWidget {
  final IconData icon;
  const IconContainer({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: MyAppColors.roundbuttonColor,
      ),
      child: Icon(
        icon,
        color: MyAppColors.textdarkmodeColor,
        size: 40.0,
      ),
    );
  }
}
