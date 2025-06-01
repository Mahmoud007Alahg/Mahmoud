import 'package:flutter/material.dart';
import 'package:flutter/src/services/text_formatter.dart';

class CustomTextFormField2 extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? icon;
  final Icon? prefixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final VoidCallback? onIconPressed;

  const CustomTextFormField2({
    super.key,
    required this.controller,
    required this.hintText,
    this.icon,
    this.prefixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onIconPressed,
    required List<TextInputFormatter> inputFormatters,
    required int maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xFFA9A9A9)),
        prefixIcon: icon != null
            ? IconButton(
          icon: Icon(icon, color: const Color(0xFF454545)),
          onPressed: onIconPressed,
        )
            : null,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
