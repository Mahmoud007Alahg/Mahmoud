import 'package:flutter/material.dart';
import '../../shared/CustomWidget/custom_tab_2.dart';
import '../../shared/custom_bottom_bar.dart';

class Student {
  final String name;
  final String grade;
  final String term;
  final String percentage;

  Student({
    required this.name,
    required this.grade,
    required this.term,
    required this.percentage,
  });
}

class TopStudents extends StatefulWidget {
  const TopStudents({super.key});

  @override
  State<TopStudents> createState() => _TopStudentsState();
}

class _TopStudentsState extends State<TopStudents> {
  final List<String> grades = [
    'الكل',
    'السابع',
    'الثامن',
    'التاسع',
    'العاشر',
    'الحادي عشر',
    'بكلوريا',
  ];

  final List<String> terms = ['فصل أول', 'فصل ثاني'];

  final List<Student> mockStudents = [
    Student(name: 'ماريا ابراهيم', grade: '11', term: 'فصل أول', percentage: '97.6'),
    Student(name: 'أشرف محفوض', grade: '11', term: 'فصل أول', percentage: '96.4'),
    Student(name: 'أحمد يوسف', grade: '9', term: 'فصل أول', percentage: '95.9'),
    Student(name: 'سارة خالد', grade: '11', term: 'فصل ثاني', percentage: '98.1'),
    Student(name: 'محمد عبد الله', grade: '11', term: 'فصل ثاني', percentage: '96.8'),
    Student(name: 'ليلى حسن', grade: '7', term: 'فصل أول', percentage: '95.5'),
    Student(name: 'سليم فهد', grade: '7', term: 'فصل أول', percentage: '94.3'),
    Student(name: 'محمد خضور', grade: '12', term: 'فصل ثاني', percentage: '96.0'),
    Student(name: 'يوسف ديوب', grade: '10', term: 'فصل أول', percentage: '96.0'),
    Student(name: 'يوسف ديوب', grade: '10', term: 'فصل ثاني', percentage: '93.0'),
    Student(name: 'عيسى إبراهيم', grade: '8', term: 'فصل ثاني', percentage: '88.0'),
    Student(name: 'حيدر غانم', grade: '9', term: 'فصل ثاني', percentage: '79.0'),
    Student(name: 'حيدر غانم', grade: '9', term: 'فصل ثاني', percentage: '79.0'),
    Student(name: 'حيدر غانم', grade: '9', term: 'فصل ثاني', percentage: '79.0'),
    Student(name: 'حيدر غانم', grade: '9', term: 'فصل ثاني', percentage: '79.0'),
    Student(name: 'حيدر غانم', grade: '9', term: 'فصل ثاني', percentage: '79.0'),
    Student(name: 'يوسف ديوب', grade: '10', term: 'فصل أول', percentage: '96.0'),
    Student(name: 'يوسف ديوب', grade: '10', term: 'فصل أول', percentage: '96.0'),
    Student(name: 'يوسف ديوب', grade: '10', term: 'فصل أول', percentage: '96.0'),
  ];

  String gradeToNumber(String grade) {
    switch (grade) {
      case 'السابع': return '7';
      case 'الثامن': return '8';
      case 'التاسع': return '9';
      case 'العاشر': return '10';
      case 'الحادي عشر': return '11';
      case 'بكلوريا': return '12';
      default: return '';
    }
  }

  List<Student> getStudentsByGradeAndTerm(String grade, String term) {
    if (grade == 'الكل' && term == 'الكل') return mockStudents;
    if (grade == 'الكل') return mockStudents.where((s) => s.term == term).toList();
    if (term == 'الكل') return mockStudents.where((s) => s.grade == gradeToNumber(grade)).toList();
    return mockStudents.where((s) => s.grade == gradeToNumber(grade) && s.term == term).toList();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.search, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 0, highlightActiveItem: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              'الطلبة الأوائل',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
             SizedBox(height: screenSize.height*(32/932)),
            Expanded(
              child: CustomTabScaffold(
                // tabPadding: const EdgeInsets.symmetric(horizontal: 8),
                tabTitles: grades,
                tabContents: grades.map((grade) {
                  return CustomTabScaffold(
                    // tabPadding: const EdgeInsets.symmetric(horizontal: 8),
                    tabTitles: terms,
                    tabContents: terms.map((term) {
                      final students = getStudentsByGradeAndTerm(grade, term);
                      return buildTopStudentsList(students);
                    }).toList(),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget buildTopStudentsList(List<Student> students) {
    final screenSize = MediaQuery.of(context).size;
    if (students.isEmpty) {
      return const Center(child: Text('لا يوجد طلاب في هذا الصف / الفصل'));
    }

    students.sort((a, b) => double.parse(b.percentage).compareTo(double.parse(a.percentage)));
    final topStudents = students.take(3).toList();
    final otherStudents = students.skip(3).toList();

    return Column(
      children: [
        SizedBox(
          height: screenSize.height * (210/932),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              if (topStudents.isNotEmpty)
                Positioned(
                  bottom: screenSize.height*(20/932),
                  child: _buildStudentCard(topStudents[0], 1),
                ),
              if (topStudents.length > 1)
                Positioned(
                  left: screenSize.width * (25/430),
                  top: screenSize.height*(45/932),
                  child: _buildStudentCard(topStudents[1], 2),
                ),
              if (topStudents.length > 2)
                Positioned(
                  right: screenSize.width * (25/430),
                  top: screenSize.height*(45/932),
                  child: _buildStudentCard(topStudents[2], 3),
                ),
            ],
          ),
        ),
        SizedBox(height: screenSize.height*(38/932)),
        // Other Students List
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(top: screenSize.height*(30/932)),
            itemCount: otherStudents.length,
            itemBuilder: (context, index) {
              final student = otherStudents[index];
              return Padding(
                padding: EdgeInsets.only(bottom: screenSize.height*(19/932)),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(screenSize.width*(14/430)),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(222, 206, 254, 1),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${index + 4}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: screenSize.width*(14/430)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            student.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          SizedBox(height: screenSize.height*(3/932)),
                          Text('صف ${student.grade}'),
                        ],
                      ),
                    ),
                    Text('النسبة: ${student.percentage}%'),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildStudentCard(Student student, int rank) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          // alignment: Alignment.center,
          children: [
            Container(
              width: screenSize.width*(80/430),
              height: screenSize.height*(80/932),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/compressed.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Medal (46x46) positioned at top center
            Positioned(
              top: 0,
              child: Image.asset(
                _getMedalAsset(rank),
                width: screenSize.width*(30/430),
                height: screenSize.height*(30/932),
              ),
            ),
          ],
        ),
         SizedBox(height: screenSize.height*(18/932)),
        Text(
          student.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text('صف ${student.grade}'),
        Text('${student.percentage}%'),
      ],
    );
  }

  String _getMedalAsset(int rank) {
    switch (rank) {
      case 1: return 'assets/ListIcons/Group 149.png';
      case 2: return 'assets/ListIcons/Group 150 (1).png';
      case 3: return 'assets/ListIcons/Group 150.png';
      default: return '';
    }
  }
}