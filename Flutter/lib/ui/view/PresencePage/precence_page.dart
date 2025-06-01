import 'package:fl/ui/shared/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

class PrecencePage extends StatefulWidget {
  const PrecencePage({super.key});

  @override
  State<PrecencePage> createState() => _PrecencePageState();
}

class _PrecencePageState extends State<PrecencePage> {
  final int totalDays = 90;

  final List<Map<String, String>> absenceRecords = [
    {
      'date': '2024/11/2',
      'situation': 'الحالة : غياب',
      'justify': 'التبرير : غير موجود',
    },
    {
      'date': '2024/4/29',
      'situation': 'الحالة : غياب',
      'justify': 'التبرير : سبب صحي ( موثّق )',
    },
    {
      'date': '2024/2/12',
      'situation': 'الحالة : غياب',
      'justify': 'التبرير : موثّق من قبل الأهل',
    },
    {
      'date': '2024/1/8',
      'situation': 'الحالة : غياب',
      'justify': 'التبرير : غير مبرر',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final int absencesCount = absenceRecords.length;
    final int presenceCount = totalDays - absencesCount;

    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(highlightActiveItem: false, currentIndex: 0,),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF2F2F2),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenSize.width * (8 / 430),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_forward),
            ),
          ),
        ],
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
      ),
      backgroundColor: const Color(0xFFF2F2F2),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * (24 / 430),
          ),
          child: Column(
            children: [
              SizedBox(height: screenSize.height * (40 / 932)),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'الحضور والغياب',
                  style: TextStyle(
                    fontSize: screenSize.width * (24 / 430),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * (48 / 932)),
              Container(
                width: screenSize.width * (379 / 430),
                height: screenSize.height * (160 / 932),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color.fromRGBO(249, 249, 249, 1),
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
                      Container(
                        width: screenSize.width * (160 / 430),
                        height: screenSize.height * (39 / 932),
                        decoration:  BoxDecoration(
                          color: Color.fromRGBO(218, 197, 253, 0.5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text('عدد الأيام الكلي  : 90'),
                        ),
                      ),
                      SizedBox(height: screenSize.height * (24 / 932)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenSize.width * (8 / 430),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: screenSize.width * (100 / 430),
                              height: screenSize.height * (39 / 932),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color.fromRGBO(253, 197, 197, 0.5),
                              ),
                              child: Center(
                                child: Text('الغيابات : $absencesCount'),
                              ),
                            ),
                            SizedBox(width: screenSize.width * (160 / 430)),
                            Container(
                              width: screenSize.width * (100 / 430),
                              height: screenSize.height * (39 / 932),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(223, 251, 225, 1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text('الحضور : $presenceCount'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * (32 / 932)),
              ...absenceRecords.map(
                (record) => Precence(
                  date: record['date']!,
                  situation: record['situation']!,
                  justify: record['justify']!,
                ),
              ),
              SizedBox(height: screenSize.height * (40 / 932)),
            ],
          ),
        ),
      ),
    );
  }
}

class Precence extends StatelessWidget {
  final String date;
  final String situation;
  final String justify;

  const Precence({
    super.key,
    required this.date,
    required this.situation,
    required this.justify,
  });

  bool get isJustified {
    final lowerJustify = justify.toLowerCase();
    return lowerJustify.contains('موثّق') ||
        // lowerJustify.contains('مبرر') ||
        lowerJustify.contains('مبررة');
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenSize.height * (32 / 932)),
      child: Container(
        width: screenSize.width * (382 / 430),
        height: screenSize.height * (90 / 932),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isJustified ? Colors.green : Colors.red,
              width: 1.5,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              date,
              style: TextStyle(
                fontSize: screenSize.width * (16 / 430),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenSize.height * (16 / 932)),
            Text(
              situation,
              style: TextStyle(
                fontSize: screenSize.width * (14 / 430),
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              justify,
              style: TextStyle(
                fontSize: screenSize.width * (14 / 430),
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
