import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';


class CustomAuthTextFormField extends StatelessWidget {
  const CustomAuthTextFormField({
    super.key,
    required this.hint,
    this.validator,
    required this.label,
    this.obsecureText = false,
    this.onChanged,
    required this.prefix,
    this.suffix,
  });
  final String hint;
  final String? Function(String?)? validator;
  final String label;
  final bool obsecureText;
  final Function(String)? onChanged;
  final Icon prefix;
  final Widget? suffix;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      cursorColor: primaryColor,
      validator: validator,
      obscureText: obsecureText,
      decoration: InputDecoration(
        // style here
        label: Text(label),
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        hintText: hint,
        prefixIcon: prefix,
        suffixIcon: suffix,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            14,
          ),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            14,
          ),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            14,
          ),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            14,
          ),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
      ),
      cursorErrorColor: Colors.red,
    );
  }
}
