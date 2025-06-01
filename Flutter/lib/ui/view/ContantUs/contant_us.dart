import 'package:fl/ui/shared/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

class ContantUs extends StatefulWidget {
  const ContantUs({super.key});

  @override
  State<ContantUs> createState() => _ContantUsState();
}

class _ContantUsState extends State<ContantUs> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      bottomNavigationBar: CustomBottomNavBar(
       currentIndex: 0,
       highlightActiveItem: false,
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2F2F2),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_forward, color: Colors.black),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * (24 / 430),
        ),
        child: Column(
          children: [
            SizedBox(height: screenSize.height * (30 / 932)),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'تواصل معنا',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: screenSize.width * (24 / 430),
                ),
              ),
            ),
            SizedBox(height: screenSize.height * (24 / 932)),
            ContantUSCont(
              image: 'assets/ListIcons/Frame 427319055.png',
              title: 'اتصل بنا' ,
              phone: '963978542312+',
              onTap: (){},
            ),
            SizedBox(width: screenSize.width * (16 / 430)),
            ContantUSCont(
              image: 'assets/ListIcons/Frame 427319055 (1).png',
              title: 'قم بمراسلتنا',
              phone: 'info@example.com',
              onTap: (){},
            ),
            SizedBox(height: screenSize.height*(40/932),),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'إدارة المدرسة',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: screenSize.width * (24 / 430),
                ),
              ),
            ),
            SizedBox(height: screenSize.height*(24/932),),
            Align(
                alignment: Alignment.centerRight,
                child: Text('أ. محمود الحاج - مدير المدرسة')),
            SizedBox(height: screenSize.height*(8/932),),
            Align(
                alignment: Alignment.centerRight,
                child: Text('الدوام المكتبي : 8:00 صباحًا - 1:00 ظهرًا')),
          ],
        ),
      ),
    );
  }
}

class ContantUSCont extends StatefulWidget {
  final String image;
  final String title;
  final String phone;
  final VoidCallback? onTap; // ← هنا


  const ContantUSCont({super.key, required this.image, required this.title, required this.phone, this.onTap});

  @override
  State<ContantUSCont> createState() => _ContantUSContState();
}

class _ContantUSContState extends State<ContantUSCont> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenSize.height * (12 / 932)),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: screenSize.width * (382 / 430),
          height: screenSize.height * (72 / 932),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color.fromRGBO(249, 249, 249, 1),
            boxShadow: [
              BoxShadow(
                color: const Color.fromRGBO(123, 47, 247, 0.25),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              SizedBox(width: screenSize.width * (8 / 430)),
              Image.asset(
                widget.image,
                width: screenSize.width * (60 / 430),
                height: screenSize.height * (60 / 932),
              ),
              SizedBox(width: screenSize.width * (16 / 430)),
              Column(
                children: [
                  SizedBox(height: screenSize.height*(12/932),),
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: screenSize.width * (16 / 430),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: screenSize.height * (4 / 430)),
                  Text(
                    widget.phone,
                    style: TextStyle(
                      fontSize: screenSize.width * (16 / 430),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
