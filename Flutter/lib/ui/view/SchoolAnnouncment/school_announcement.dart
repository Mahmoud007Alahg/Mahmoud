import 'package:fl/ui/shared/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../../shared/CustomWidget/custom_tab_2.dart';
import '../../shared/CustomWidget/school_act_cont.dart';

class SchoolAnnouncement extends StatefulWidget {
  const SchoolAnnouncement({super.key});

  @override
  State<SchoolAnnouncement> createState() => _SchoolAnnouncementState();
}

class _SchoolAnnouncementState extends State<SchoolAnnouncement> {

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final tabTitles = ['الكل', 'المدير', 'المعلمين'];
    final tabContents = [
      SchoolActCont(
        activities: [

        ],
        filteredActivities: [],
      ),
      Center(child: Text('نشاطات الرواد')),
      Center(child: Text('نشاطات ترفيهية')),
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
              'إعلانات المدرسة',
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
