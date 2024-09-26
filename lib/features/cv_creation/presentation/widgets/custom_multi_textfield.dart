import 'package:flutter/material.dart';

class CustomMultilineTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final int maxLines;
  final String? Function(String?)? validator;

  const CustomMultilineTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.maxLines = 5,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      validator: validator,
    );
  }
}
