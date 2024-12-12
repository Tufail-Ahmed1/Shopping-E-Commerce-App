import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {

  const TextFieldWidget({super.key,
    required this.controller,
    required this.secure,
    required this.text,
    required this.icon,});

  final String text;
  final Icon icon;
  final TextEditingController controller;
  final bool secure;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: secure,
      decoration: InputDecoration(
          hintText: text,
          prefixIcon: icon,
          fillColor:  Colors.white,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
      ),);
  }
}