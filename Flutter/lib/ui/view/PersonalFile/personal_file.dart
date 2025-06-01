import 'package:fl/ui/view/MyActivities/my_activities.dart';
import 'package:flutter/material.dart';
import '../../shared/CustomWidget/custom-button.dart';
import '../../shared/custom_bottom_bar.dart';

class PersonalFile extends StatefulWidget {
  const PersonalFile({super.key});

  @override
  State<PersonalFile> createState() => _PersonalFileState();
}

class _PersonalFileState extends State<PersonalFile> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
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
        automaticallyImplyLeading: false,
      ),
      backgroundColor: const Color(0xFFF2F2F2),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 0,
        onTap: (index) {
          // TODO: Handle navigation
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * (24 / 430),
        ),
        child: Column(
          children: [
            SizedBox(height: screenSize.height * (24 / 932)),
            Center(
              child: Image.asset(
                'assets/images/Profile1.png',
                width: screenSize.width * (104 / 430),
                height: screenSize.height * (104 / 932),
              ),
            ),
            SizedBox(height: screenSize.height * (24 / 932)),
            Text(
              'عيسى ابراهيم',
              style: TextStyle(
                fontSize: screenSize.width * (24 / 430),
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: screenSize.height * (10 / 932)),
            Text(
              'صف 10',
              style: TextStyle(
                fontSize: screenSize.width * (24 / 430),
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: screenSize.height * (24 / 932)),
            Container(
              width: screenSize.width * (240 / 430),
              height: screenSize.height * (40 / 932),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color.fromRGBO(249, 249, 249, 1),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromRGBO(123, 47, 247, 0.25),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenSize.width * (16 / 430),
                ),
                child: Row(
                  children: [
                    Text(
                      'معدلك',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: screenSize.width * (20 / 430),
                      ),
                    ),
                    Spacer(),
                    Text(
                      '82%',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: screenSize.width * (20 / 430),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenSize.height * (32 / 932)),
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(249, 249, 249, 1),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromRGBO(123, 47, 247, 0.25),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              width: screenSize.width * (382 / 430),
              padding: EdgeInsets.symmetric(
                horizontal: screenSize.width * (8 / 430),
                vertical: screenSize.height * (8 / 932),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/Icons/Icon (7).png',
                        width: screenSize.width * (32 / 430),
                        height: screenSize.height * (32 / 932),
                      ),
                      SizedBox(width: screenSize.width * (8 / 430)),
                      Text(
                        'طالب',
                        style: TextStyle(
                          fontSize: screenSize.width * (16 / 430),
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(28, 28, 28, 1),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenSize.height * (12 / 932)),
                  Row(
                    children: [
                      Image.asset(
                        'assets/Icons/mail-open.png',
                        width: screenSize.width * (32 / 430),
                        height: screenSize.height * (32 / 932),
                      ),
                      SizedBox(width: screenSize.width * (8 / 430)),
                      Text(
                        'info@example.com',
                        style: TextStyle(
                          fontSize: screenSize.width * (16 / 430),
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(28, 28, 28, 1),
                        ),
                      ),
                      Spacer(),
                      Image.asset('assets/Icons/pen.png'),
                    ],
                  ),
                  SizedBox(height: screenSize.height * (12 / 932)),
                  Row(
                    children: [
                      Image.asset(
                        'assets/Icons/Icon (8).png',
                        width: screenSize.width * (32 / 430),
                        height: screenSize.height * (32 / 932),
                      ),
                      SizedBox(width: screenSize.width * (8 / 430)),
                      Text(
                        '963-9368-521-00+',
                        style: TextStyle(
                          fontSize: screenSize.width * (16 / 430),
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(28, 28, 28, 1),
                        ),
                      ),
                      Spacer(),
                      Image.asset('assets/Icons/pen.png'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: screenSize.height * (96 / 932)),
            SizedBox(
              width: double.infinity,
              child: CustomButton(label: 'عرض نشاطاتي', onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyActivities()));
              }),
            ),
            SizedBox(height: screenSize.height * (16 / 932)),
            Container(
              height: screenSize.height * (56 / 932),
              width: screenSize.width * (382 / 430),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color.fromRGBO(123, 47, 247, 1),
                    Color.fromRGBO(166, 99, 204, 1),
                  ],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(1), // سمك الحد
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Color.fromRGBO(106, 70, 168, 1),
                          // rgba(106, 70, 168, 1)
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          title: const Text(
                            'متأكد من تسجيل الخروج؟',
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          actionsAlignment: MainAxisAlignment.spaceBetween,
                          actions: [
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    // TODO: تنفيذ منطق تسجيل الخروج هنا
                                  },
                                  child: const Text(
                                    'تأكيد',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'إلغاء',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2F2F2),
                      borderRadius: BorderRadius.circular(6),
                      // أقل من الخارجي بـ 2
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(123, 47, 247, 0.25),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'تسجيل الخروج',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenSize.width * (18 / 430),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
