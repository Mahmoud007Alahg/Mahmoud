import 'package:fl/ui/view/ChangePassword/ConfirmCode/confirm_code.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../shared/CustomWidget/custom-button.dart';
import '../../../shared/CustomWidget/custom-text-form-field.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  String? _savedEmail;

  @override
  void initState() {
    super.initState();
    _setTemporaryEmail();
    _loadSavedEmail();
  }

  Future<void> _setTemporaryEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_email','mahmoud@alhag.com');
  }

  Future<void> _loadSavedEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedEmail = prefs.getString('user_email');
    });
  }



  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF2F2F2),
      body: Stack(
        children: [
          _buildBackgroundImages(screenSize),
          Positioned(
            top: screenSize.height * (46 / 932),
            left: screenSize.width * (24 / 430),
            child: IconButton(
              icon:  Icon(Icons.arrow_forward,
                  size: screenSize.height*(28/932),
                  color: Color.fromRGBO(38, 38, 38, 1)
              ),
              onPressed: () {
                  Navigator.of(context).pop();
              },
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: screenSize.width * (24 / 430)),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenSize.height * (133 / 932)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenSize.width * (118 / 430)),
                    child: Image.asset(
                      'assets/images/forgot password illustration.png',
                      width: screenSize.width * (136 / 430),
                      height: screenSize.height * (136 / 932),
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.06),
                  _buildTitleText('تغيير كلمة السر', bold: true),
                  SizedBox(height: screenSize.height * 0.03),
                  _buildTitleText('لإعادة تعيين كلمة السر، يُرجى إدخال\nحسابك الإلكتروني'),
                  SizedBox(height: screenSize.height * (40 / 932)),
                  CustomTextFormField(
                    icon: Icons.mail_outline,
                    controller: _emailController,
                    hintText: 'البريد الإلكتروني',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى إدخال البريد الإلكتروني';
                      }
                      String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                      RegExp regex = RegExp(pattern);
                      if (!regex.hasMatch(value)) {
                        return 'يرجى إدخال بريد إلكتروني صالح';
                      }
                      if (_savedEmail != null && value != _savedEmail) {
                        return 'البريد الإلكتروني لا يتطابق مع الحساب المسجل';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenSize.height * (108 / 932)),
                  CustomButton(
                    label: 'تغيير كلمة السر',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (_savedEmail != null && _emailController.text.trim() == _savedEmail) {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const ConfirmCode()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('البريد الإلكتروني غير مطابق، يرجى إدخال البريد الصحيح'),
                              backgroundColor: Color.fromRGBO(123, 47, 247, 0.4),
                                // rgba(123, 47, 247, 0.7)
                            ),
                          );
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleText(String text, {bool bold = false}) {
    final screenSize = MediaQuery.of(context).size;
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(
        fontSize: screenSize.width * (24 / 430),
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        color: const Color(0xFF454545),
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