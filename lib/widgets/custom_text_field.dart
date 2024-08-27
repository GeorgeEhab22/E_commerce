import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      style: const TextStyle(color: Colors.grey),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: text,
        hintStyle: const TextStyle(color: Colors.grey, height: 0.8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
