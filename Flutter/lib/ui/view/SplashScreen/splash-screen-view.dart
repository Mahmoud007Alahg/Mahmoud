import 'package:fl/ui/view/Intro/intro.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Intro1View(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
                screenWidth * (86 / 430),
                screenHeight * (238 / 932),
                screenWidth * (86 / 430),
                screenHeight * (16 / 932)),
            child: Image(
              image: const AssetImage('assets/images/Logo (1).png'),
              width: screenWidth * (258 / 430),
              height: screenHeight * (258 / 932),
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: screenWidth*(59/430)),
            child: Text(
              'Al-Mutafawiqin School',
              style: TextStyle(
                fontSize: screenWidth*(32/430),
                fontWeight: FontWeight.w700,
                color: const Color.fromRGBO(38, 38, 38, 1),
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * (8 / 932),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: screenWidth*(59/430)),
            child: Text(
              'Stay Connected, Stay Informed',
              style: TextStyle(
                fontSize: screenWidth*(23/430),
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(69, 69, 69, 1),
              ),
            ),
          )
        ],
      ),
    );
  }
}