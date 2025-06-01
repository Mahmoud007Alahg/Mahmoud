import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String imagePath;
  final String subjectName;
  final String grade;

  const CustomContainer({
    super.key,
    required this.imagePath,
    required this.subjectName,
    required this.grade,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenSize.height * (24 / 932) , horizontal: screenSize.width*(12/430)),
      child: Container(
        width: screenSize.width * (382 / 430),
        height: screenSize.height * (64 / 932),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color.fromRGBO(123, 47, 247, 0.7),
              width: 1.0,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  imagePath,
                  width: screenSize.width * (48 / 430),
                  height: screenSize.height * (48 / 932),
                  color: const Color.fromRGBO(106, 70, 168, 0.5),
                ),
                SizedBox(width: screenSize.width*(16/430)),
                Text(
                  subjectName,
                  style: TextStyle(
                    fontSize: screenSize.width * (16 / 430),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                grade,
                style: const TextStyle(
                  color: Color.fromRGBO(123, 47, 247, 1),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
