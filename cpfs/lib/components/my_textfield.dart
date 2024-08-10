import 'package:flutter/material.dart';

class MytextField extends StatelessWidget {
  final controller;
  final String hintName;
  final bool obscureText;
  const MytextField({super.key, required this.controller, required this.hintName, required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400)),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintName,
          hintStyle: TextStyle(color: Colors.grey[500])
        ),
      ),
    );
  }
}
