import 'package:fl/ui/shared/CustomWidget/school_act_cont.dart';
import 'package:fl/ui/shared/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:fl/ui/shared/CustomWidget/custom_tab_2.dart';
import '../school_activity_model.dart';

class SchoolAct extends StatelessWidget {
  const SchoolAct({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final activities = [
      SchoolActivity(
        title: 'انضم إلى رواد الشطرنج',
        description: 'منافسات شطرنج بين الطلاب.',
        imagePath: 'assets/images/Chess.png',
        type: 'الرواد',
        date: 'تبدأ في 2025/4/28',
      ),
      SchoolActivity(
        title: 'انضم إلى رواد المعلوماتية',
        description: 'رحلة إلى حديقة الحيوانات.',
        imagePath: 'assets/images/Computer.png',
        type: 'الرواد',
        date: 'تبدأ في 2025/4/28',

      ),
      SchoolActivity(
        title: 'رحلة إلى المتحف',
        description: 'لنستكشف التاريخ معًا للتسجيل مراجعة إدارة المدرسة\nموعد التسجيل : 4/29 --> 5/3',
        imagePath: 'assets/images/Museum.png',
        type: ' ترفيهية',
        date: 'تبدأ في 2025/4/28',

      ),
      SchoolActivity(
        title: 'حفل الربيع الموسيقي',
        description:
            'نحتفل بكم ومعكم في قدوم فصل الربيع بدء الاجتماع للقيام بالحفل الساعة الخامسة مساءًا',
        imagePath: 'assets/images/Queue music.png',
        type: 'داخل المدرسة',
        date: 'تبدأ في 2025/4/28',

      ),
    ];
    final tabTitles = ['الكل', 'الرواد', 'ترفيهية', 'داخل المدرسة'];
    final tabContents = [
      SchoolActCont(filteredActivities: activities, activities: []),
      SchoolActCont(
        filteredActivities:
            activities.where((act) => act.type == 'الرواد').toList(),
        activities: [],
      ),
      SchoolActCont(
        filteredActivities:
            activities.where((act) => act.type == 'ترفيهية').toList(),
        activities: [],
      ),
      SchoolActCont(
        filteredActivities:
            activities.where((act) => act.type == 'داخل المدرسة').toList(),
        activities: [],
      ),
    ];

    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(
        highlightActiveItem: false,
        currentIndex: 0,
      ),
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
                  icon: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_forward),
                  ),
                ),
              ],
            ),
          ),
        ],
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
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
              'النشاطات المدرسية',
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
    );
  }
}


