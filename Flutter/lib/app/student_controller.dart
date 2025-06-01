import 'package:get/get.dart';

class Student {
  final String name;
  final String grade;
  final String className;
  final String imageUrl;

  Student({
    required this.name,
    required this.grade,
    required this.className,
    required this.imageUrl,
  });
}

class StudentController extends GetxController {
  var student = Student(
    name: 'عيسى إبراهيم',
    grade: '10',
    className: '2',
    imageUrl: 'https://example.com/student-photo.jpg',
  ).obs;

  void fetchStudentData() async {
    // TODO: هنا سيتم جلب البيانات من API
    // عند توافر ال API مستقبلاً، قم بتحديث المتغير student
  }
}
