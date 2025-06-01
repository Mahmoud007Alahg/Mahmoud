import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: screenSize.height * (56 / 932),
        width: screenSize.width * (382 / 430),
          // rgba(123, 47, 247, 0.25)
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromRGBO(123, 47, 247, 0.25),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(123, 47, 247, 1),
              Color.fromRGBO(166, 99, 204, 1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: screenSize.width * (18 / 430),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}