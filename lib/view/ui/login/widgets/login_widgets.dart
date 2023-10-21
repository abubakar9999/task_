import 'package:flutter/material.dart';

class CustomTextFeildWidget extends StatelessWidget {
  const CustomTextFeildWidget({
    super.key,
    required this.controller,
    required this.lebel,
  });

  final TextEditingController controller;
  final String lebel;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: lebel,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
