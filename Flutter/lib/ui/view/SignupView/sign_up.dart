import 'package:fl/ui/shared/CustomWidget/custom-button.dart';
import 'package:fl/ui/view/SignupView/sign_up2.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _selectedRole = '';

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: screenSize.height * (106 / 932),
                right: screenSize.width * (135 / 430),
                left: screenSize.width * (135 / 430),
              ),
              child: Image.asset(
                'assets/images/Splash_Logo.png',
                width: screenSize.width * 0.37,
                height: screenSize.height * 0.18,
              ),
            ),
            SizedBox(height: screenSize.height * (64 / 932)),
            Text(
              'قم بإنشاء حسابك',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: screenSize.width * (24 / 430),
              ),
            ),
            SizedBox(height: screenSize.height * (40 / 932)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenSize.width * (24 / 430)),
              child: Column(
                children: [
                  Text(
                    'في حال كنت من الكادر الإداري للمدرسة، يُرجى تحديد نوع حسابك ك “ موظف “',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: screenSize.width * (18 / 430)),
                  ),
                  Text(
                    'أما في حال كنت طالب أو ولي أمر طالب ضمن المدرسة، يُرجى تحديد نوع حسابك ك “ طالب “',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: screenSize.width * (18 / 430)),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenSize.height * (56 / 932)),
            SizedBox(
              width: screenSize.width * (382 / 430),
              height: screenSize.height * (48 / 932),
              child: DropdownButton<String>(
                dropdownColor: const Color(0xFFF2F2F2),
                value: _selectedRole.isEmpty ? null : _selectedRole,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedRole = newValue!;
                  });
                },
                items: <String>['موظف', 'طالب']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,
                        style: const TextStyle(color: Colors.black)),
                  );
                }).toList(),
                hint: Text(
                  'موظف/ طالب',
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
                icon: const Icon(Icons.keyboard_arrow_down_outlined,
                    color: Colors.black),
                isExpanded: true,
                underline: Container(height: 1, color: Colors.black),
              ),
            ),
            SizedBox(
              height: screenSize.height * (184 / 932),
            ),
            // Padding(
            //   padding: EdgeInsets.only(
            //     left: screenSize.width * (24 / 430),
            //     right: screenSize.width * (24 / 430),
            //     top: screenSize.height * (184 / 932),
            //   ),
            //   child: GestureDetector(
            //     onTap: () {
            //       if (_selectedRole.isEmpty) {
            //         ScaffoldMessenger.of(context).showSnackBar(
            //           const SnackBar(content: Text('يرجى اختيار نوع الحساب!')),
            //         );
            //       } else {
            //         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const SignUp2()));
            //       }
            //     },
            //     child: Container(
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(8),
            //         color: const Color(0xFF9D2FBA),
            //       ),
            //       height: screenSize.height * (56 / 932),
            //       child: Center(
            //         child: Text(
            //           'التالي',
            //           style: TextStyle(
            //             color: Colors.white,
            //             fontSize: screenSize.width * (18 / 430),
            //             fontWeight: FontWeight.w700,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            CustomButton(
              label: 'التالي',
              onPressed: () {
                if (_selectedRole.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('يرجى اختيار نوع الحساب!')),
                  );
                } else {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const SignUp2()));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
