import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:fl/ui/view/SplashScreen/splash-screen-view.dart';
import 'package:fl/app/student_controller.dart';
import 'package:fl/core/services/notifications_provider.dart';

void main() {
  Get.put(StudentController());

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NotificationProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      textDirection: TextDirection.rtl,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'tajawal'),
      home: const SplashScreen(),
    );
  }
}
