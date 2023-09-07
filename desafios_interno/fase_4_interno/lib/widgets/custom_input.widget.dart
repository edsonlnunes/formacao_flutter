import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController controller;
  final int? maxLine;
  final String label;

  const CustomInput({
    super.key,
    required this.controller,
    required this.label,
    this.maxLine,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
      cursorColor: Colors.black,
      maxLines: maxLine,
    );
  }
}
