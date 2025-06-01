import 'package:flutter/material.dart';

class CustomWeekCard extends StatelessWidget {
  final String time;
  final String subject;
  final String teacher;

  const CustomWeekCard({
    super.key,
    required this.time,
    required this.subject,
    required this.teacher,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenSize.height * (12/ 932),
        horizontal: screenSize.width * (12 / 430),
      ),
      child: Row(
        children: [
          // وقت الحصة
          Container(
            width: screenSize.width * (58 / 430),
            height: screenSize.height * (58 / 932),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(163, 109, 249, 0.4),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1), // اللون الخفيف للظل
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 1), // ظل أسفل العنصر
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Text(
              time,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenSize.width * (12 / 430),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // اسم المادة واسم المعلم
          Container(
            width: screenSize.width * (300 / 430),
            height: screenSize.height * (58 / 932),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(218, 197, 253, 0.5),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1), // الظل الخفيف
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, 1), // ظل أسفل العنصر
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subject,
                  style: TextStyle(
                    fontSize: screenSize.width * (14 / 430),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  teacher,
                  style: TextStyle(
                    fontSize: screenSize.width * (12 / 430),
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
