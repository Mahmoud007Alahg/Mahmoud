import 'package:fl/ui/shared/CustomWidget/custom-button.dart';
import 'package:fl/ui/view/LogInView/log-in-view.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
// import 'package:get/get.dart';

class Intro1View extends StatefulWidget {
  const Intro1View({super.key});

  @override
  State<Intro1View> createState() => _Intro1ViewState();
}

class _Intro1ViewState extends State<Intro1View> {
  List<String> titleList = [
    "مدرسة المتفوقين الأولى بحمص",
    "محصلاتك وغياباتك وأكثر!",
    "هُنا مصنع التفوق!"
  ];

  List<String> imageList = [
    "assets/images/Intro_1.png",
    "assets/images/Intro_2.png",
    "assets/images/Intro_3.png"
  ];

  List<String> descriptionList = [
    "تطبيق يُساعد على متابعة الوضع الدراسي، وأخبار المدرسة من المنزل.",
    "تستطيع من خلال هذا التطبيق، رؤية محصلاتك، غياباتك وبرنامجك الدراسي بسهولة ومن خلال المعرف الخاص بك.",
    "متابعة إعلانات المسابقات والأولمبياد الخاصة بطلابنا، مع تقديم مراجع مُفيدة."
  ];

  final PageController _pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 242, 242, 1),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * (24 / 430)),
        child: Column(
          children: [
            SizedBox(height: screenHeight * (155 / 932)),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: titleList.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Image(
                        image: AssetImage(imageList[index]),
                        height: screenHeight * (273 / 932),
                      ),
                      SizedBox(height: screenHeight * (32 / 932)),
                      Text(
                        titleList[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: screenWidth * (24 / 430),
                          color: Color.fromRGBO(38, 38, 38, 1),
                        ),
                      ),
                      SizedBox(height: screenHeight * (16 / 932)),
                      Text(
                        descriptionList[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: screenWidth * (22 / 430),
                          color: Color.fromRGBO(69, 69, 69, 1),
                        ),
                      ),
                      SizedBox(height: screenHeight * (98 / 932)),
                    ],
                  );
                },
              ),
            ),

            DotsIndicator(
              dotsCount: titleList.length,
              position: currentIndex,
              decorator: DotsDecorator(
                activeColor: Color.fromRGBO(106, 70, 168, 1),
                color: Color.fromRGBO(168, 168, 168, 1),
                activeSize: Size(25, 10),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),

            SizedBox(height: screenHeight * (16 / 430)),
            CustomButton(
              label: 'التالي',
              onPressed: () {
                if (currentIndex < titleList.length - 1) {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LogInView()));
                }
              },
            ),
            SizedBox(height: screenHeight*(70/932),)
          ],
        ),
      ),
    );
  }
}