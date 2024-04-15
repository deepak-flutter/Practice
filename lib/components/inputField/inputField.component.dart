import 'package:flutter/material.dart';

class InputFieldComponent extends StatelessWidget {
  const InputFieldComponent({
    super.key,
    required this.controller,
    required this.inputType,
    required this.maxLength,
    required this.hintText,
  });

  final TextEditingController controller;
  final TextInputType inputType;
  final int maxLength;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      maxLength: maxLength,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        counterText: "",
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}