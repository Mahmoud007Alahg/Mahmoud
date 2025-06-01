import 'package:flutter/material.dart';

import '../../shared/CustomWidget/custom-button.dart';
import '../../shared/CustomWidget/custom-text-form-field.dart';
import '../SuccessPage/success_page.dart';

class SignUp4 extends StatefulWidget {
  const SignUp4({super.key});

  @override
  State<SignUp4> createState() => _SignUp4State();
}

class _SignUp4State extends State<SignUp4> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _validateAndSubmit() {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      Future.delayed(const Duration(seconds: 5), () {
        setState(() => _isLoading = false);
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(
        //     content: Text(
        //       'تمت العملية بنجاح!',
        //       textAlign: TextAlign.center,
        //       style: TextStyle(color: Colors.white),
        //     ),
        //     backgroundColor: Color.fromRGBO(185, 28, 227, 1.0),
        //   ),
        // );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SuccessPage()),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'يرجى تصحيح الأخطاء قبل المتابعة.',
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF2F2F2),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenSize.width * (24 / 430)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenSize.height * (149 / 932)),
            Text(
              'ادخل كلمة السر.',
              style: TextStyle(
                fontSize: screenSize.width * 0.06,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: screenSize.height * (24 / 932)),
            Text(
              'استخدم مزيجًا من الأرقام، والأحرف الكبيرة والصغيرة، والخاصة.',
              style: TextStyle(
                fontSize: screenSize.width * 0.04,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(192, 53, 53, 1),
              ),
            ),
            SizedBox(height: screenSize.height * (64 / 932)),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: _passwordController,
                    obscureText: _isPasswordObscured,
                    hintText: 'كلمة السر',
                    icon: _isPasswordObscured
                        ? Icons.visibility_off_outlined
                        : Icons.remove_red_eye_outlined,
                    onIconPressed: () {
                      setState(() {
                        _isPasswordObscured = !_isPasswordObscured;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء إدخال كلمة السر';
                      }
                      if (value.length < 8) {
                        return 'كلمة السر يجب أن تكون على الأقل 8 أحرف';
                      }
                      final regex = RegExp(
                        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
                      );
                      if (!regex.hasMatch(value)) {
                        return 'يجب أن تحتوي كلمة السر على أرقام، وأحرف كبيرة وصغيرة، ورمز خاص.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenSize.height * 0.02),
                  CustomTextFormField(
                    controller: _confirmPasswordController,
                    obscureText: _isConfirmPasswordObscured,
                    hintText: 'تأكيد كلمة السر',
                    icon: _isConfirmPasswordObscured
                        ? Icons.visibility_off_outlined
                        : Icons.remove_red_eye_outlined,
                    onIconPressed: () {
                      setState(() {
                        _isConfirmPasswordObscured = !_isConfirmPasswordObscured;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء إدخال تأكيد كلمة السر';
                      }
                      if (value != _passwordController.text) {
                        return 'كلمة السر وتأكيد كلمة السر غير متطابقتين';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenSize.height * (66 / 932)),
                  _isLoading
                      ? const CircularProgressIndicator(
                    color: Color.fromRGBO(157, 47, 186, 1),
                  )
                      : CustomButton(
                    onPressed: _validateAndSubmit,
                    label: 'التالي',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
