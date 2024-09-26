 import 'package:flutter/material.dart';
import 'package:resumewithus/core/theme/my_app_colors.dart';
import 'package:resumewithus/core/utils/widgets/my_appbar_shape.dart';

PreferredSizeWidget appbar() {
    return AppBar(
      toolbarHeight: 90,
      flexibleSpace: ClipPath(
        clipper: MyAppbarShape(),
        child: Container(
          height: 250.0,
          width: double.infinity,
          color: MyAppColors.appbarColor,
          child: const Center(
              child: Text(
            "Resumewithus!",
            style: TextStyle(
              fontSize: 25.0,
              color: MyAppColors.textdarkmodeColor,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          )),
        ),
      ),
    );
  }