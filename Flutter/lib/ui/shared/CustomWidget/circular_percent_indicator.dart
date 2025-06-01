import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CustomCircularPercent extends StatelessWidget {
  final double percent; // قيمة بين 0.0 و 1.0
  final double radius;
  final double lineWidth;
  final Color progressColor;
  final Color backgroundColor;
  final Widget? center;

  const CustomCircularPercent({
    super.key,
    required this.percent,
    this.radius = 60.0,
    this.lineWidth = 12.0,
    this.progressColor = Colors.purple,
    this.backgroundColor = const Color(0xFFF0F0F0),
    this.center,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return CircularPercentIndicator(
      // rgba(255, 255, 255, 0.5)
      reverse: true,
      startAngle: 90,
      radius: radius,
      lineWidth: lineWidth,
      percent: percent.clamp(0.0, 1.0),
      progressColor:  Color.fromRGBO(123, 47, 247, 1),
      backgroundColor:  Color.fromRGBO(123, 47, 247, 0.3),
      // rgba(123, 47, 247, 1)
      // rgba(166, 99, 204, 1)
      // rgba(255, 255, 255, 0.5)
      circularStrokeCap: CircularStrokeCap.round,
      center: center ?? Text(
        '${(percent * 100).toStringAsFixed(0)}%',
        style:  TextStyle(fontSize: screenSize.width*(24/430), fontWeight: FontWeight.w700),
      ),
    );
  }
}
