import 'package:flutter/material.dart';

class MyTextWidget extends StatelessWidget {
  final String text;

  const MyTextWidget({super.key, required this.text});

  String removePng(String text) {
    return text.replaceAll('.png', '');
  }

  @override
  Widget build(BuildContext context) {
    return Text(removePng(text));
  }
}
