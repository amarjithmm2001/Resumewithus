import 'package:flutter/material.dart';
import 'package:resumewithus/core/theme/my_app_colors.dart';
import 'package:resumewithus/core/utils/widgets/my_appbar_shape.dart';

PreferredSizeWidget specialappbar({required String appbarName}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    leading: const Align(
      alignment: Alignment.topLeft,
      child: BackButton(
        color: MyAppColors.textdarkmodeColor,
      ),
    ),
    toolbarHeight: 110,
    flexibleSpace: ClipPath(
      clipper: MyAppbarShape(),
      child: Container(
        height: 250.0,
        width: double.infinity,
        color: MyAppColors.appbarColor,
        child: Center(
          child: Text(
            appbarName,
            style: const TextStyle(
              fontSize: 23.0,
              color: MyAppColors.textdarkmodeColor,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ),
    ),
  );
}
