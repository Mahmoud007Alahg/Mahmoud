import 'package:fl/ui/shared/custom_bottom_bar.dart';
import 'package:fl/ui/view/SchoolOlympics/student_olympiad_info.dart';
import 'package:flutter/material.dart';

class OlympiadStudent {
  final String imagePath;
  final String name;
  final String specialty;

  OlympiadStudent({
    required this.imagePath,
    required this.name,
    required this.specialty,
  });

  factory OlympiadStudent.fromJson(Map<String, dynamic> json) {
    return OlympiadStudent(
      imagePath: json['image'] ?? 'assets/images/default.png',
      name: json['name'] ?? '',
      specialty: json['specialty'] ?? '',
    );
  }
}

class SchoolOlympics extends StatefulWidget {
  const SchoolOlympics({super.key});

  @override
  State<SchoolOlympics> createState() => _SchoolOlympicsState();
}

class _SchoolOlympicsState extends State<SchoolOlympics> {
  final List<OlympiadStudent> students = [
    OlympiadStudent(
      imagePath: 'assets/images/Profile1.png',
      name: 'محمد أحمد',
      specialty: 'الرياضيات',
    ),
    OlympiadStudent(
      imagePath: 'assets/images/Profile1.png',
      name: 'خالد يوسف',
      specialty: 'الفيزياء',
    ),
    OlympiadStudent(
      imagePath: 'assets/images/Profile1.png',
      name: 'سارة علي',
      specialty: 'الكيمياء',
    ),
    OlympiadStudent(
      imagePath: 'assets/images/Profile1.png',
      name: 'ليلى سمير',
      specialty: 'الأحياء',
    ),
    OlympiadStudent(
      imagePath: 'assets/images/Profile1.png',
      name: 'ماريا ابراهيم',
      specialty: 'المعلوماتية',
    ),
    OlympiadStudent(
      imagePath: 'assets/images/Profile1.png',
      name: 'مطر حسين',
      specialty: 'المعلوماتية',
    ),
    OlympiadStudent(
      imagePath: 'assets/images/Profile1.png',
      name: 'رانيا خالد',
      specialty: 'المعلوماتية',
    ),
    OlympiadStudent(
      imagePath: 'assets/images/Profile1.png',
      name: 'يوسف ديوب',
      specialty: 'اللغة العربية',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
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
      bottomNavigationBar: CustomBottomNavBar(
        highlightActiveItem: false,
        currentIndex: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * (24 / 430),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: screenSize.height * (40 / 932)),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'أولمبياد المتفوقين',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: screenSize.width * (24 / 430),
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * (16 / 932)),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'تعرف على ممثلين مدرستنا في الأولمبياد.',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: screenSize.width * (16 / 430),
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * (40 / 932)),
              Container(
                width: screenSize.width * (382 / 430),
                height: screenSize.height * (530 / 932),
                padding: const EdgeInsets.all(12),
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
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(students.length * 2 - 1, (index) {
                      if (index.isEven) {
                        final student = students[index ~/ 2];
                        return OlympicsCont(
                          imagePath: student.imagePath,
                          studentName: student.name,
                          specialty: student.specialty,
                        );
                      } else {
                        return Container(
                          width: screenSize.width * (350 / 430),
                          height: 1,
                          color: const Color.fromRGBO(106, 70, 168, 1),
                          margin: const EdgeInsets.symmetric(vertical: 8),
                        );
                      }
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class OlympicsCont extends StatelessWidget {
  final String imagePath;
  final String studentName;
  final String specialty;

  const OlympicsCont({
    super.key,
    required this.imagePath,
    required this.studentName,
    required this.specialty,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => OlympiadDetailsScreen(
              imagePath: imagePath,
              name: studentName,
              specialty: specialty,
            ),
          ),
        );
      },
      child: Container(
        width: screenSize.width * (350 / 430),
        height: screenSize.height * (74 / 932),
        padding:
        EdgeInsets.symmetric(horizontal: screenSize.width * (16 / 430)),
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                width: screenSize.width * (64 / 430),
                height: screenSize.height * (64 / 932),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: screenSize.width * (16 / 430)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  studentName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenSize.width * (16 / 430),
                  ),
                ),
                SizedBox(height: screenSize.height * (10 / 932)),
                Text(
                  specialty,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: screenSize.width * (14 / 430),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
