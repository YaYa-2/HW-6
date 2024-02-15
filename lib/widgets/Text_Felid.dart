import 'package:flutter/material.dart';

class TextFelidWidget extends StatelessWidget {
  const TextFelidWidget(
      {super.key,
      required this.labelText,
      required this.hintText,

      this.controller});
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}