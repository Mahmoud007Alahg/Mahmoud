import 'package:fl/ui/shared/CustomWidget/custom_container.dart';
import 'package:flutter/material.dart';
import '../../shared/CustomWidget/circular_percent_indicator.dart';
import '../../shared/custom_bottom_bar.dart';
import '../../shared/CustomWidget/custom_tab_2.dart';

class ExamRes extends StatefulWidget {
  const ExamRes({super.key});

  @override
  State<ExamRes> createState() => _ExamResState();
}

class _ExamResState extends State<ExamRes> {
  List<int> gradesFirstTerm = [90, 85, 78, 88, 92, 80, 76, 84, 70, 91, 87];
  List<int> gradesSecondTerm = [80, 82, 75, 78, 70, 77, 73, 76, 72, 81, 79];
  bool isLoading = false;
  bool hasError = false;

  String getEncouragementMessage(double percent) {
    double percentage = percent * 100;
    if (percentage >= 90) {
      return 'عمل ممتاز!\n استمر بالتقدم';
    } else if (percentage >= 80) {
      return '\n\nاستمر بالعمل الناجح';
    } else if (percentage >= 60) {
      return '\nعمل جيد، نحن معك\n حتى الوصول للقمة';
    } else if (percentage >= 40) {
      return 'لا تقلق، السهم يحتاج\n للرجوع للانطلاق بسرعة';
    } else {
      return 'ابدأ من جديد،\n نحن نؤمن بك!';
    }
  }

  double calculateAverage(List<int> grades) {
    if (grades.isEmpty) return 0;
    int total = grades.reduce((a, b) => a + b);
    return total / grades.length;
  }

  Widget buildContent(List<int> grades, Size screenSize) {
    final double average = calculateAverage(grades);
    final double percent = average / 100;

    if (isLoading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text("جاري تحميل النتائج...", style: TextStyle(fontSize: 18)),
        ],
      );
    }

    if (hasError) {
      return const Center(child: Text("حدث خطأ أثناء تحميل البيانات."));
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              CustomCircularPercent(percent: percent),
              SizedBox(width: screenSize.width * (32 / 430)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${getEncouragementMessage(percent).split('!')[0]}!',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: screenSize.width * (20 / 430),
                    ),
                  ),
                  SizedBox(height: screenSize.height * (16 / 932)),
                  Text(
                    getEncouragementMessage(percent).split('!').length > 1
                        ? getEncouragementMessage(percent).split('!')[1].trim()
                        : '',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: screenSize.width * (20 / 430),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          if (grades.length >= 11) ...[
            CustomContainer(
              imagePath: 'assets/Icons/Math--Streamline-Tabler.svg.png',
              subjectName: 'رياضيات',
              grade: grades[0].toString(),
            ),
            CustomContainer(
              imagePath:
                  'assets/Icons/Microscope-Observation-Sciene--Streamline-Plump.svg.png',
              subjectName: 'علوم عامة',
              grade: grades[1].toString(),
            ),
            CustomContainer(
              imagePath:
                  'assets/Icons/Desktop-Tower-Light--Streamline-Phosphor.svg.png',
              subjectName: 'معلوماتية',
              grade: grades[2].toString(),
            ),
            CustomContainer(
              imagePath: 'assets/Icons/book-open.png',
              subjectName: 'لغة عربية',
              grade: grades[3].toString(),
            ),
            CustomContainer(
              imagePath:
                  'assets/Icons/Sports-Handball--Streamline-Sharp-Material-Symbols.svg.png',
              subjectName: 'رياضة',
              grade: grades[4].toString(),
            ),
            CustomContainer(
              imagePath: 'assets/Icons/book-open.png',
              subjectName: 'لغة انجليزية',
              grade: grades[5].toString(),
            ),
            CustomContainer(
              imagePath: 'assets/Icons/Music--Streamline-Unicons.svg.png',
              subjectName: 'موسيقا',
              grade: grades[6].toString(),
            ),
            CustomContainer(
              imagePath: 'assets/Icons/book-open.png',
              subjectName: 'لغة فرنسية',
              grade: grades[7].toString(),
            ),
            CustomContainer(
              imagePath:
                  'assets/Icons/Palette-Light--Streamline-Phosphor.svg.png',
              subjectName: 'فنون',
              grade: grades[8].toString(),
            ),
            CustomContainer(
              imagePath: 'assets/Icons/book-open.png',
              subjectName: 'تربية دينية',
              grade: grades[9].toString(),
            ),
            CustomContainer(
              imagePath: 'assets/Icons/book-open.png',
              subjectName: 'اجتماعيات',
              grade: grades[10].toString(),
            ),
          ] else
            const Center(child: Text("لم يتم تحميل العلامات كاملة")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final tabTitles = ['فصل أول', 'فصل ثاني'];
    final tabContents = [
      buildContent(gradesFirstTerm, screenSize),
      buildContent(gradesSecondTerm, screenSize),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2F2F2),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenSize.width * (8 / 430),
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ),
        ],
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 0,
        onTap: (index) {},
        highlightActiveItem: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * (24 / 430),
        ),
        child: Column(
          children: [
            SizedBox(height: screenSize.height * (24 / 932)),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'النتائج الامتحانية',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: screenSize.width * (24 / 430),
                ),
              ),
            ),
            SizedBox(height: screenSize.height * (40 / 932)),
            Expanded(
              child: CustomTabScaffold(
                tabTitles: tabTitles,
                tabContents: tabContents,
              ),
            ),
            SizedBox(height: screenSize.height * (24 / 932)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'حمّل جلاءك المدرسي',
                  style: TextStyle(
                    fontSize: screenSize.width * (14 / 430),
                    fontWeight: FontWeight.w300,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'بالضغط هنا',
                    style: TextStyle(
                      fontSize: screenSize.width * (14 / 430),
                      fontWeight: FontWeight.w700,
                      color: Colors.black
                    ),
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
