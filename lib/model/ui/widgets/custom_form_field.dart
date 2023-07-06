import 'package:flutter/material.dart';

typedef Validator = String? Function(String?);

class CustomFormField extends StatelessWidget {
  final String hintText;
  final Validator? validator;
  final TextInputType? type;
  final TextEditingController? controller;
  final bool hideText;

  const CustomFormField(
      {super.key,
      required this.hintText,
      this.type = TextInputType.text,
      this.validator,
      this.hideText = false,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: TextFormField(
        obscureText: hideText,
        controller: controller,
        validator: validator,
        keyboardType: type,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: hintText,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)))),
      ),
    );
  }
}
