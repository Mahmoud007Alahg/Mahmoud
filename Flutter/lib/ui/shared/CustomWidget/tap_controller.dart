import 'package:flutter/material.dart';

class WeeklySchedulePage extends StatelessWidget {
  final List<Map<String, String>> schedule = [
    {'subject': 'رياضيات', 'time': '8:00 - 8:45', 'teacher': 'أ.أكرم'},
    {'subject': 'ديانة', 'time': '8:45 - 9:30', 'teacher': 'أ.محمد'},
    {'subject': 'علوم', 'time': '9:45 - 10:30', 'teacher': 'أ.وفاء'},
    {'subject': 'لغة إنجليزية', 'time': '10:30 - 11:15', 'teacher': 'أ.ربيع'},
    {'subject': 'فيزياء', 'time': '11:30 - 12:15', 'teacher': 'أ.وصال'},
    {'subject': 'تاريخ', 'time': '12:15 - 1:00', 'teacher': 'أ.يوسف'},
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      initialIndex: 5, // ليبدأ من "الأحد"
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.arrow_back, color: Colors.black),
              Text('البرنامج الأسبوعي',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              Icon(Icons.search, color: Colors.black),
            ],
          ),
          bottom: TabBar(
            isScrollable: true,
            labelColor: Colors.purple,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.purple,
            indicatorWeight: 3,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            dividerColor: Colors.transparent, // إزالة الخط الرمادي
            tabs: [
              Tab(text: 'الخميس'),
              Tab(text: 'الأربعاء'),
              Tab(text: 'الثلاثاء'),
              Tab(text: 'الاثنين'),
              Tab(text: 'الأحد'),
            ],
          ),
        ),
        body: TabBarView(
          children: List.generate(5, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListView.builder(
                itemCount: schedule.length,
                itemBuilder: (context, i) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xFFEBDCFF),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(schedule[i]['subject']!,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16)),
                            SizedBox(height: 4),
                            Text(schedule[i]['teacher']!,
                                style: TextStyle(color: Colors.grey[700])),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(schedule[i]['time']!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  );
                },
              ),
            );
          }),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.menu), label: '', tooltip: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: '', tooltip: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: '', tooltip: ''),
          ],
        ),
      ),
    );
  }
}
