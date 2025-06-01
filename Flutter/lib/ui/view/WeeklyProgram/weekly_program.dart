import 'package:fl/ui/shared/CustomWidget/custom_week_card.dart';
import 'package:fl/ui/shared/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../../shared/CustomWidget/custom_tab_2.dart';

class WeeklyProgram extends StatefulWidget {
  const WeeklyProgram({super.key});

  @override
  State<WeeklyProgram> createState() => _WeeklyProgramState();
}

class _WeeklyProgramState extends State<WeeklyProgram> {
  final List<List<Map<String, String>>> weeklySubjects = [
    [
      {'subject': 'رياضيات', 'teacher': 'أ. أحمد'},
      {'subject': 'علوم', 'teacher': 'أ. ليلى'},
      {'subject': 'عربي', 'teacher': 'أ. محمد'},
      {'subject': 'دين', 'teacher': 'أ. علي'},
      {'subject': 'تاريخ', 'teacher': 'أ. سمير'},
      {'subject': 'جغرافيا', 'teacher': 'أ. هند'},
    ],
    [
      {'subject': 'كيمياء', 'teacher': 'أ. سامي'},
      {'subject': 'فيزياء', 'teacher': 'أ. عبير'},
      {'subject': 'إنجليزي', 'teacher': 'أ. سارة'},
      {'subject': 'رياضيات', 'teacher': 'أ. أحمد'},
      {'subject': 'حاسوب', 'teacher': 'أ. وليد'},
      {'subject': 'فن', 'teacher': 'أ. منى'},
    ],
    [
      {'subject': 'أحياء', 'teacher': 'أ. لينا'},
      {'subject': 'رياضيات', 'teacher': 'أ. أحمد'},
      {'subject': 'جغرافيا', 'teacher': 'أ. هند'},
      {'subject': 'فيزياء', 'teacher': 'أ. عبير'},
      {'subject': 'دين', 'teacher': 'أ. علي'},
      {'subject': 'تاريخ', 'teacher': 'أ. سمير'},
    ],
    [
      {'subject': 'حاسوب', 'teacher': 'أ. وليد'},
      {'subject': 'عربي', 'teacher': 'أ. محمد'},
      {'subject': 'رياضيات', 'teacher': 'أ. أحمد'},
      {'subject': 'علوم', 'teacher': 'أ. ليلى'},
      {'subject': 'تربية رياضية', 'teacher': 'أ. كريم'},
      {'subject': 'فن', 'teacher': 'أ. منى'},
    ],
    [
      {'subject': 'دين', 'teacher': 'أ. علي'},
      {'subject': 'كيمياء', 'teacher': 'أ. سامي'},
      {'subject': 'فيزياء', 'teacher': 'أ. عبير'},
      {'subject': 'رياضيات', 'teacher': 'أ. أحمد'},
      {'subject': 'عربي', 'teacher': 'أ. محمد'},
      {'subject': 'علوم', 'teacher': 'أ. ليلى'},
    ],
  ];

  final List<String> times = [
    '8:00    8:45',
    '9:00    9:30',
    '9:45    10:30',
    '10:30   11:15',
    '11:30   12:15',
    '12:15    1:00',
  ];

  final tabTitles = ['الأحد', 'الاثنين', 'الثلاثاء', 'الأربعاء', 'الخميس'];
  late final List<Widget> tabContents;

  @override
  void initState() {
    super.initState();
    tabContents = List.generate(
      weeklySubjects.length,
          (index) => buildDayContent(weeklySubjects[index]),
    );
  }

  Widget buildDayContent(List<Map<String, String>> subjects) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(6, (index) {
          final subject = subjects[index]['subject']!;
          final teacher = subjects[index]['teacher']!;
          return CustomWeekCard(
            time: times[index],
            subject: subject,
            teacher: teacher,
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return DefaultTabController(
      length: tabTitles.length,
      child: Scaffold(
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
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenSize.height * (25 / 932)),
              Text(
                'البرنامج الأسبوعي',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: screenSize.width * (24 / 430),
                ),
              ),
              SizedBox(height: screenSize.height * (32 / 932)),
              Expanded(
                child: CustomTabScaffold(
                  tabTitles: tabTitles,
                  tabContents: tabContents,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
