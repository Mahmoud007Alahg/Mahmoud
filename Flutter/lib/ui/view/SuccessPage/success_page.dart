import 'package:fl/ui/shared/CustomWidget/custom-button.dart';
import 'package:flutter/material.dart';
import '../LogInView/log-in-view.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: Stack(
        children: [
          _buildBackgroundImages(screenSize),
          Column(
            children: [
              SizedBox(
                height: screenSize.height * (287 / 932),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenSize.width * (147 / 430)),
                child: Image(
                  image: const AssetImage('assets/images/illustration (1).png'),
                  width: screenSize.width * (136 / 430),
                  height: screenSize.height * (136 / 932),
                ),
              ),
              SizedBox(
                height: screenSize.height * (24 / 932),
              ),
              Text(
                'تمت العملية بنجاح !',
                style: TextStyle(
                    fontSize: screenSize.width * (24 / 430),
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: screenSize.height * (46 / 932),
              ),
            CustomButton(label: "تسجيل الدخول", onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LogInView()));
            })
            ],
          ),
        ],
      ),
    );
  }
  Widget _buildBackgroundImages(Size screenSize) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          right: 0,
          child: Image.asset(
            "assets/images/Ellipse 3.png",
            width: screenSize.width * (146 / 430),
            height: screenSize.height * (154 / 932),
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Transform.rotate(
            angle: 3.1416,
            child: Image.asset(
              "assets/images/Ellipse 3.png",
              width: screenSize.width * (146 / 430),
              height: screenSize.height * (154 / 932),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}


