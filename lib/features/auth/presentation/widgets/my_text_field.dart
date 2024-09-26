import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hinttext;
  final TextEditingController controller;

  const MyTextField({
    super.key,
    required this.hinttext,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hinttext,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if(value!.isEmpty){
          return "You forgot to add $hinttext";
        }
        return null;
      },
    );
  }
}
