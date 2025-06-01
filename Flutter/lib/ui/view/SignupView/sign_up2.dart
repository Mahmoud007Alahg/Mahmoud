import 'package:fl/ui/view/SignupView/sign_up3.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../shared/CustomWidget/custom-button.dart';
import '../../shared/CustomWidget/custom-text-form-field-2.dart';

class SignUp2 extends StatefulWidget {
  const SignUp2({super.key});

  @override
  State<SignUp2> createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
  final TextEditingController _idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF2F2F2),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * 0.06,
          vertical: screenSize.height * 0.16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'اهلًا بك في مدرسة المتفوقين الأولى بحمص.',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: screenSize.height * 0.03),
            const Text(
              'ادخل المعرّف الخاص بك.',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: screenSize.height * 0.07),
            CustomTextFormField2(
              controller: _idController,
              hintText: 'المعرف الخاص بك',
              icon: Icons.credit_card_rounded,
              keyboardType: TextInputType.number,
              maxLength: 5,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'الرجاء إدخال المعرف الخاص بك';
                }
                if (value.length != 5) {
                  return 'المعرف يجب أن يكون مكونًا من 5 أرقام';
                }
                return null;
              },
            ),
            SizedBox(height: screenSize.height * 0.11),
            CustomButton(
              label: 'التالي',
              onPressed: () {
                // التحقق من صحة المدخلات
                if (_idController.text.length == 5) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SignUp3(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('الرجاء إدخال معرف صالح')),
                  );
                }
              },
            ),
            SizedBox(height: screenSize.height * (24 / 932)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'لا تملك المعرّف الخاص؟',
                  style: TextStyle(
                      fontSize: screenSize.width*(16/430),
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(40, 40, 40, 1)),
                ),
                TextButton(
                    onPressed: () {},
                    child:  Text(
                      'تواصل معنا',
                      style: TextStyle(
                          fontSize: screenSize.width*(16/430),
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(38, 38, 38, 1)),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
