import 'package:flutter/material.dart';

class CustomTextFormField3 extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? prefixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const CustomTextFormField3({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon, // استقبال الأيقونة كمقدمة (pre)
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: TextInputType.number, // السماح بإدخال الأرقام فقط
      validator: validator ??
              (value) {
            if (value == null || value.isEmpty) {
              return 'الرجاء إدخال المعرف الخاص بك';
            }
            if (!RegExp(r'^\d{5}$').hasMatch(value)) {
              return 'يجب أن يتكون المعرف من 5 أرقام فقط';
            }
            return null;
          },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xFFA9A9A9)),
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: const Color(0xFF454545), size: 24) // تعيين الأيقونة كمقدمة
            : null,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}