import 'package:fl/ui/shared/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

class OlympiadDetailsScreen extends StatelessWidget {
  final String imagePath;
  final String name;
  final String specialty;

  const OlympiadDetailsScreen({
    super.key,
    required this.imagePath,
    required this.name,
    required this.specialty,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 0,
        highlightActiveItem: false,
      ),
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFF2F2F2),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenSize.width * (8 / 430),
            ),
            child: Row(
              children: [
                SizedBox(width: screenSize.width * (70 / 430)),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(screenSize.width * (24 / 430)),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(360),
                  child: Image.asset(imagePath),
                ),
                SizedBox(height: screenSize.height * (24 / 932)),
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenSize.width * (24 / 430),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.015),
                Text(
                  specialty,
                  style: TextStyle(
                    fontSize: screenSize.width * (18 / 430),
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: screenSize.height * (40 / 932)),
                Container(
                  width: screenSize.width * (382 / 430),
                  height: screenSize.height * (265 / 932),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(123, 47, 247, 0.25),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'الأولمبياد ',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: screenSize.width * (24 / 430),
                            ),
                          ),
                        ),
                        SizedBox(height: screenSize.height * (24 / 932)),
                        Row(
                          children: [
                            Image.asset('assets/Icons/chart-line-up.png'),
                            SizedBox(width: screenSize.width * (16 / 430)),
                            Text(
                              'مرحلة الأولمبياد',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: screenSize.width * (16 / 430),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenSize.height * (24 / 932)),
                        Row(
                          children: [
                            Image.asset('assets/Icons/alarm-clock-alt.png'),
                            SizedBox(width: screenSize.width * (16 / 430)),
                            Text(
                              'الموعد القادم',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: screenSize.width * (16 / 430),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenSize.height * (24 / 932)),
                        Row(
                          children: [
                            Image.asset('assets/Icons/user.png'),
                            SizedBox(width: screenSize.width * (16 / 430)),
                            Text(
                              'الأستاذ المشرف',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: screenSize.width * (16 / 430),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * (16 / 932)),
                Container(
                  width: screenSize.width * (382 / 430),
                  height: screenSize.height * (125 / 932),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(123, 47, 247, 0.25),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'الإنجازات ',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: screenSize.width * (24 / 430),
                            ),
                          ),
                        ),
                        SizedBox(height: screenSize.height * (24 / 932)),
                        Row(
                          children: [
                            Image.asset('assets/Icons/medal.png'),
                            SizedBox(width: screenSize.width * (16 / 430)),
                            Text(
                              '',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: screenSize.width * (16 / 430),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * (16 / 932)),

                Container(
                  width: screenSize.width * (382 / 430),
                  height: screenSize.height * (196 / 932),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(123, 47, 247, 0.25),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'المهارات ',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: screenSize.width * (24 / 430),
                            ),
                          ),
                        ),
                        SizedBox(height: screenSize.height * (24 / 932)),
                        Row(
                          children: [
                            Image.asset('assets/Icons/code (1).png'),
                            SizedBox(width: screenSize.width * (16 / 430)),
                            Text(
                              '',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: screenSize.width * (16 / 430),
                              ),
                            ),
                            SizedBox(height: screenSize.height * (24 / 932)),
                          ],
                        ),
                        SizedBox(height: screenSize.height * (24 / 932)),
                        Row(
                          children: [
                            Image.asset('assets/Icons/chart-pie-alt-1.png'),
                            SizedBox(width: screenSize.width * (16 / 430)),
                            Text(
                              '',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: screenSize.width * (16 / 430),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height*(56/932),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
