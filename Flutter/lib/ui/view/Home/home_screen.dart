import 'dart:io';
import 'package:fl/ui/shared/CustomWidget/navigation_cards.dart';
import 'package:fl/ui/view/ExamRes/exam_res.dart';
import 'package:fl/ui/view/Home/top_students_section.dart';
import 'package:fl/ui/view/PresencePage/precence_page.dart';
import 'package:fl/ui/view/SchoolActivites/school_act.dart';
import 'package:fl/ui/view/TopStudents/top_students.dart';
import 'package:fl/ui/view/WeeklyProgram/weekly_program.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/services/notifications_provider.dart';
import '../../shared/custom_bottom_bar.dart';
import '../Notifications/notifications.dart';
import '../SchoolAnnouncment/school_announcement.dart';
import 'announcement_card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    _loadSavedImage();
  }

  Future<void> _loadSavedImage() async {
    final prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString('student_image_path');
    if (imagePath != null && File(imagePath).existsSync()) {
      setState(() {
        _imageFile = File(imagePath);
      });
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      final dir = await getApplicationDocumentsDirectory();
      final name = path.basename(pickedFile.path);
      final savedImage = await File(pickedFile.path).copy('${dir.path}/$name');

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('student_image_path', savedImage.path);

      setState(() {
        _imageFile = savedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
      appBar: const HomePageAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StudentInfoSection(imageFile: _imageFile, onPickImage: _pickImage),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 1,
        onTap: (index) {},
        highlightActiveItem: true,
      ),
    );
  }

  getApplicationDocumentsDirectory() {}
}

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final hasNotifications =
        context.watch<NotificationProvider>().hasNotifications;

    return Column(
      children: [
        AppBar(
          backgroundColor: const Color(0xFFF2F2F2),
          elevation: 0,
          automaticallyImplyLeading: false,
          title: const Text(
            'مدرسة المتفوقين',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          actions: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.notifications_none,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    context.read<NotificationProvider>().setHasNotifications(
                      false,
                    );
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Notifications()),
                    );
                  },
                ),
                if (hasNotifications)
                  Positioned(
                    right: 12,
                    top: 12,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.purple,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * (24 / 430),
          ),
          child: Container(
            width: double.infinity,
            height: 4,
            color: const Color.fromRGBO(123, 47, 247, 0.7),
          ),
        ),
      ],
    );
  }
}

class StudentInfoSection extends StatelessWidget {
  final File? imageFile;
  final VoidCallback onPickImage;

  const StudentInfoSection({
    super.key,
    required this.imageFile,
    required this.onPickImage,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenSize.width * (24 / 430)),
      child: Column(
        children: [
          SizedBox(height: screenSize.height * (40 / 932)),
          Row(
            children: [
              Image.asset(
                'assets/images/Profile1.png',
                width: screenSize.width * (72 / 430),
                height: screenSize.height * (72 / 932),
              ),
              SizedBox(width: screenSize.width * (24 / 430)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'عيسى إبراهيم',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'صف 10 شعبة 2',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: screenSize.height * (40 / 932)),
          NavigationCard(
            title: 'البرنامج الأسبوعي',
            subtitle: 'استعرض برنامجك الأسبوعي ',
            color: Color.fromRGBO(123, 47, 247, 0.7),
            imagePath: 'assets/Icons/calendar-days.png',
            iconColor: Colors.white,
            textColor: Colors.white,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WeeklyProgram()),
              );
            },
          ),
          SizedBox(height: screenSize.height * (24 / 932)),
          // rgba(123, 47, 247, 0.7)
          NavigationCard(
            title: 'النتائج الامتحانية',
            subtitle: 'استعرض الجلاء الدراسي',
            color: Color.fromRGBO(218, 197, 253, 0.5),
            imagePath: 'assets/Icons/Exam Grade.png',
            textColor: Colors.black,
            iconColor: Colors.black,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExamRes()),
              );
            },
          ),
          SizedBox(height: screenSize.height * (24 / 932)),
          // rgba(218, 197, 253, 0.5)
          NavigationCard(
            title: 'النشاطات المدرسية',
            subtitle: 'استعرض النشاطات المدرسية',
            color: Color.fromRGBO(123, 47, 247, 0.7),
            imagePath: 'assets/Icons/face-smile.png',
            textColor: Colors.white,
            iconColor: Colors.white,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SchoolAct()),
              );
            },
          ),
          SizedBox(height: screenSize.height * (40 / 932)),
          Row(
            children: [
              Text(
                'إعلانات المدرسة',
                style: TextStyle(
                  fontSize: screenSize.width * (24 / 430),
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(width: screenSize.width * (161 / 430)),
              IconButton(icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SchoolAnnouncement()));
                  }
              ),
            ],
          ),
          SizedBox(height: screenSize.height * (25.5 / 932)),
          AnnouncementCard(
            announcerName: 'أ. محمود الحاج(المدير)',
            announcementImage:
                'assets/images/ChatGPT Image Apr 27, 2025, 07_52_36 PM 1.png',
            announcementText:
                'تذكير : اجتماع أولياء الأمور غدًا  \n التوقيت : الساعة 10 صباحًا3/7',
            timeAgo: 'منذ 3 ساعات',
            announcerImage:
                'assets/images/40 Top Examples of Professional Headshots - Bored Art.png',
            tag: 'هام',
          ),
          SizedBox(height: screenSize.height * (24 / 932)),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'الطلبة الأوائل ',
              style: TextStyle(
                fontSize: screenSize.width * (24 / 430),
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: screenSize.height * (16 / 932)),
          Row(
            children: [
              TopStudentsSection(
                imagePath: 'assets/images/unsplash_Di4fY1EIxxA.png',
                studentName: 'محمد أحمد',
              ),
              SizedBox(width: screenSize.width * (16 / 430)),
              TopStudentsSection(
                imagePath: 'assets/images/unsplash_Di4fY1EIxxA (1).png',
                studentName: 'ماريا ابراهيم',
              ),
              SizedBox(width: screenSize.width * (20 / 430)),
              TopStudentsSection(
                imagePath: 'assets/images/unsplash_VLOAN0i_as8.png',
                studentName: 'حيدر غانم',
              ),
              SizedBox(width: screenSize.width * ( 53/ 430)),
              Transform.translate(
                offset: Offset(0, -screenSize.height * (16 / 932)),
                child: Container(
                  width: screenSize.width * (64 / 430),
                  height: screenSize.height * (64 / 932),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(218, 197, 253, 0.5),
                  ),
                  child: IconButton(onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TopStudents()));
                  } , icon: Icon(Icons.arrow_forward_ios),),
                ),
              ),
            ],
          ),
          SizedBox(height: screenSize.height * (40 / 932)),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'الحضور والغياب ',
              style: TextStyle(
                fontSize: screenSize.width * (24 / 430),
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: screenSize.height * (16 / 932)),
          GestureDetector(
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => PrecencePage()));
            },
            child: Container(
              width: screenSize.width * (379 / 430),
              height: screenSize.height * (160 / 932),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color.fromRGBO(249, 249, 249, 1),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(123, 47, 247, 0.25), // ظل ناعم
                    blurRadius: 10,
                    offset: const Offset(0, 4), // ظل للأسفل قليلاً
                    // rgba(123, 47, 247, 0.25)
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: screenSize.height * (16 / 932),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/Icons/Vector.png',
                      width: screenSize.width * (39 / 430),
                      height: screenSize.height * (59 / 932),
                    ),
                    SizedBox(height: screenSize.height * (16 / 932)),
                    Column(
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'غياب',
                                style: TextStyle(
                                  color: Color.fromRGBO(192, 53, 53, 1),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: ' : 3 أيام',
                                style: TextStyle(color: Colors.black),
                              ),
                              // rgba(192, 53, 53, 1)
                            ],
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'حضور',
                                style: TextStyle(
                                  color: Color.fromRGBO(46, 204, 113, 1),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: ' : 85 يوم',
                                style: TextStyle(color: Colors.black),
                              ),
                              // rgba(46, 204, 113, 1)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: screenSize.height * (48 / 932)),
        ],
      ),
    );
  }
}
