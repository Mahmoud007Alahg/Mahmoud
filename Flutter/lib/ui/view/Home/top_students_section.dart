import 'package:flutter/material.dart';

class TopStudentsSection extends StatelessWidget {
  final String imagePath;
  final String studentName;

  const TopStudentsSection({
    super.key,
    required this.imagePath,
    required this.studentName,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: screenSize.width * (64 / 430),
          height: screenSize.height * (64 / 932),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: screenSize.height*(16/932)), // مسافة بين الصورة والاسم
        Text(
          studentName,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}