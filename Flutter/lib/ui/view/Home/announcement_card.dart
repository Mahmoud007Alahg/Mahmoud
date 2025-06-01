import 'package:flutter/material.dart';

class AnnouncementCard extends StatelessWidget {
  final String announcerName;
  final String announcerImage;
  final String announcementImage;
  final String announcementText;
  final String timeAgo;
  final String tag;

  const AnnouncementCard({
    super.key,
    required this.announcerName,
    required this.announcerImage,
    required this.announcementImage,
    required this.announcementText,
    required this.timeAgo,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenSize.width * (24 / 430)),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF9F9F9), // لون خلفية خفيف
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(123, 47, 247, 0.25), // ظل ناعم
                  blurRadius: 10,
                  offset: const Offset(0, 4), // ظل للأسفل قليلاً
                    // rgba(123, 47, 247, 0.25)
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(
              vertical: screenSize.height * (8 / 932),
              horizontal: screenSize.width * (8 / 430),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        announcerImage,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          announcerName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          timeAgo,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Stack(
                    children: [
                      Image.asset(
                        announcementImage,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: screenSize.height * (8 / 932),
                        right: screenSize.width * (8 / 430),
                        child: Transform.rotate(
                          angle: 0.7854, // زاوية 45 درجة (لتدوير الدبوس)
                          child: const Icon(
                            Icons.push_pin_sharp,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  announcementText,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 8),
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(0, 0, 0, 0.05), // لون خلفية التاغ
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    tag,
                    style: const TextStyle(color: Colors.black, fontSize: 12),
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
