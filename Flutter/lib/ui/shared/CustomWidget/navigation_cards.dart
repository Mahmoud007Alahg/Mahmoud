import 'package:flutter/material.dart';

class NavigationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;
  final String imagePath;
  final Color textColor;
  final Color iconColor;
  final VoidCallback onTap; // تمرير دالة للضغط

  const NavigationCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.imagePath,
    required this.textColor,
    required this.iconColor,
    required this.onTap, // إضافة الـ onTap
  });


  @override
Widget build(BuildContext context) {
  final screenSize = MediaQuery.of(context).size;
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            // rgba(123, 47, 247, 0.25)
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Image(
            image: AssetImage(imagePath),
            width: screenSize.width * (48 / 430),
            height: screenSize.height * (48 / 932),
          ),
          SizedBox(width: screenSize.width * (17 / 430)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: screenSize.width * (20 / 430),
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: screenSize.width * (16 / 430),
                  color: textColor,
                ),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: onTap,
            child: Icon(Icons.arrow_forward_ios, color: iconColor),
          ),
        ],
      ),
    ),
  );
}
}