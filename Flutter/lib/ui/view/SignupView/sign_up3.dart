import 'package:fl/ui/view/SignupView/sign_up4.dart';
import 'package:flutter/material.dart';

import '../../shared/CustomWidget/custom-button.dart';
import '../../shared/CustomWidget/custom-text-form-field.dart';

class SignUp3 extends StatefulWidget {
  const SignUp3({super.key});

  @override
  State<SignUp3> createState() => _SignUp3State();
}

class _SignUp3State extends State<SignUp3> {
  final TextEditingController _emailController = TextEditingController();
  final RegExp emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF2F2F2),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: screenSize.width*(24/430)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenSize.height*(149/932),),
            const Text(
              'اهلًا بك محمود مازن الحاج.',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: screenSize.height * 0.03),
            const Text(
              'ادخل بريدك الإلكتروني.',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: screenSize.height * 0.07),
            CustomTextFormField(
              controller: _emailController,
              hintText: 'البريد الإلكتروني',
              icon: Icons.mail_outline,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'الرجاء إدخال البريد الإلكتروني الخاص بك';
                }
                if (!emailRegex.hasMatch(value)) {
                  return 'الرجاء إدخال بريد إلكتروني صالح';
                }
                return null;
              },
            ),
            SizedBox(height: screenSize.height * 0.11),
            CustomButton(
              label: 'التالي',
              onPressed: () {
                if (_emailController.text.isNotEmpty &&
                    emailRegex.hasMatch(_emailController.text)) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SignUp4(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('الرجاء إدخال بريد إلكتروني صالح')),
                  );
                }
              },
            ),
            SizedBox(height: screenSize.height * (24 / 932)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'إذا كانت هناك مشكلة بالاسم',
                  style: TextStyle(
                    fontSize: screenSize.width * (16 / 430),
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(40, 40, 40, 1),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'تواصل معنا',
                    style: TextStyle(
                      fontSize: screenSize.width * (16 / 430),
                      fontWeight: FontWeight.w700,
                      color: const Color.fromRGBO(38, 38, 38, 1),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
