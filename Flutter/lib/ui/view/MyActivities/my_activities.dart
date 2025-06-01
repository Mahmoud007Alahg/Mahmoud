import 'package:fl/ui/shared/CustomWidget/school_act_cont.dart';
import 'package:fl/ui/shared/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:fl/ui/shared/CustomWidget/custom_tab_2.dart';
import '../school_activity_model.dart';

class MyActivities extends StatefulWidget {
  const MyActivities({super.key});

  @override
  State<MyActivities> createState() => _MyActivitiesState();
}

class _MyActivitiesState extends State<MyActivities> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final activities = [
      SchoolActivity(
        title: 'مشاركة في مسابقة الرياضيات',
        description: 'ستقام في قاعة الاجتماعات الكبرى.',
        imagePath: 'assets/Icons/Math--Streamline-Tabler.svg.png',
        type: 'القادم',
        date: '2025/6/1',
      ),
      SchoolActivity(
        title: 'مخيم العلوم',
        description: 'انتهى الأسبوع الماضي وكان ناجحاً.',
        imagePath: 'assets/Icons/Microscope-Observation-Sciene--Streamline-Plump.svg.png',
        type: 'الماضي',
        date: '2025/4/15',
      ),
      SchoolActivity(
        title: 'ورشة البرمجة',
        description: 'لطلاب الصف التاسع والعاشر.',
        imagePath: 'assets/Icons/Desktop-Tower-Light--Streamline-Phosphor.svg.png',
        type: 'القادم',
        date: '2025/6/5',
      ),
    ];

    final tabTitles = ['الجميع', 'القادم', 'الماضي'];
    final tabContents = [
      SchoolActCont(filteredActivities: activities, activities: []),
      SchoolActCont(
        filteredActivities:
        activities.where((act) => act.type == 'القادم').toList(),
        activities: [],
      ),
      SchoolActCont(
        filteredActivities:
        activities.where((act) => act.type == 'الماضي').toList(),
        activities: [],
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2F2F2),
        automaticallyImplyLeading: false,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenSize.height * (24 / 932)),
            Text(
              'نشاطاتي',
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
