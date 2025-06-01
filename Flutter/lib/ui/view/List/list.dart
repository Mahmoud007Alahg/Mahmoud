import 'package:fl/ui/shared/custom_bottom_bar.dart';
import 'package:fl/ui/view/ContantUs/contant_us.dart';
import 'package:fl/ui/view/ExamRes/exam_res.dart';
import 'package:fl/ui/view/PersonalFile/personal_file.dart';
import 'package:fl/ui/view/SchoolAnnouncment/school_announcement.dart';
import 'package:fl/ui/view/SchoolOlympics/school_olympics.dart';
import 'package:fl/ui/view/Settings/settings.dart';

// import 'package:fl/ui/view/Home/home_screen.dart';
import 'package:flutter/material.dart';

class ListMenu extends StatefulWidget {
  const ListMenu({super.key});

  @override
  State<ListMenu> createState() => _ListMenuState();
}

class _ListMenuState extends State<ListMenu> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 2,
        onTap: (index) {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => ListMenu()));
        },
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2F2F2),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_forward, color: Colors.black),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * (24 / 430),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/Profile1.png',
                    width: screenSize.width * (96 / 430),
                    height: screenSize.height * (96 / 932),
                  ),
                  SizedBox(width: screenSize.width * (16 / 430)),
                  Column(
                    children: [
                      Text(
                        'عيسى ابراهيم',
                        style: TextStyle(
                          fontSize: screenSize.width * (16 / 430),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: screenSize.height * (10 / 932)),
                      Text(
                        'صف 10 شعبة 2',
                        style: TextStyle(
                          fontSize: screenSize.width * (16 / 430),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: screenSize.height * (32 / 932)),
              ListContainer(
                image: 'assets/ListIcons/Icon (4).png',
                title: 'الملف الشخصي',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PersonalFile()));
                },
              ),
              ListContainer(
                image: 'assets/ListIcons/Icon (5).png',
                title: 'إعلانات المدرسة',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SchoolAnnouncement()));

                },
              ),
              ListContainer(
                image: 'assets/ListIcons/Exam Grade (1).png',
                title: 'نتائجك الامتحانية',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ExamRes()));

                },
              ),
              ListContainer(
                image: 'assets/ListIcons/winners-medal-svgrepo-com 1.png',
                title: 'أولمبياد المدرسة',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SchoolOlympics()));
                },
              ),
              ListContainer(
                image: 'assets/ListIcons/phone.png',
                title: 'تواصل معنا',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ContantUs()));
                },
              ),
              ListContainer(
                image: 'assets/ListIcons/Icon (6).png',
                title: 'الإعدادات',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Settings()));
                },
              ),
              ListContainer(
                image: 'assets/ListIcons/Log Out.png',
                title: 'تسجيل خروج',
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
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
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
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class ListContainer extends StatefulWidget {
  final String image;
  final String title;
  final VoidCallback? onTap;

  const ListContainer({
    super.key,
    required this.image,
    required this.title,
    this.onTap,
  });

  @override
  State<ListContainer> createState() => _ListContainerState();
}

class _ListContainerState extends State<ListContainer> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenSize.height * (12 / 932)),
      child: GestureDetector(
        onTap: widget.onTap, // ← هنا نربط الضغط
        child: Container(
          width: screenSize.width * (379 / 430),
          height: screenSize.height * (52 / 932),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color.fromRGBO(249, 249, 249, 1),
            boxShadow: [
              BoxShadow(
                color: const Color.fromRGBO(123, 47, 247, 0.25),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              SizedBox(width: screenSize.width * (8 / 430)),
              Image.asset(
                widget.image,
                width: screenSize.width * (24 / 430),
                height: screenSize.height * (24 / 932),
              ),
              SizedBox(width: screenSize.width * (16 / 430)),
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: screenSize.width * (20 / 430),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
