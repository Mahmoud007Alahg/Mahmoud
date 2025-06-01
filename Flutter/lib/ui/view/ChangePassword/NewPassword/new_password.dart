import 'package:fl/ui/shared/CustomWidget/custom-button.dart';
import 'package:flutter/material.dart';

import '../../../shared/CustomWidget/custom-text-form-field.dart';
import '../../SuccessPage/success_page.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;
  bool _isLoading = false;

  void _changePassword() {
    if (_formKey.currentState!.validate()) {
      if (_passwordController.text != _confirmPasswordController.text) {
        _showSnackBar('كلمة السر وتأكيد كلمة السر غير متطابقتين');
        return;
      }
      setState(() => _isLoading = true);
      Future.delayed(const Duration(seconds: 3), () {
        setState(() => _isLoading = false);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const SuccessPage()),
        );
      });
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message, textAlign: TextAlign.center)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF2F2F2),
      body: Stack(
        children: [
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
          _buildBackgroundImages(screenSize),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.06),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenSize.height*(133/932),),
                Center(
                  child: Image.asset(
                    'assets/images/illustration.png',
                    width: screenSize.width * 0.32,
                    height: screenSize.height * 0.15,
                  ),
                ),
                SizedBox(height: screenSize.height * 0.06),
                Text(
                  'كلمة السر الجديدة',
                  style: TextStyle(
                    fontSize: screenSize.width * (24/430),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: screenSize.height * (32/932)),
                Text(
                  'ادخل كلمة السر الجديدة',
                  style: TextStyle(
                    fontSize: screenSize.width * (24/430),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: screenSize.height * 0.01),
                Text(
                  'استخدم مزيجًا من الأرقام,الأحرف الكبيرة,الصغيرةوالخاصة.',
                  style: TextStyle(
                    fontSize: screenSize.width * (15/430),
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(192, 53, 53, 1),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.06),
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
                        hintText: 'تأكيد كلمة السر',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenSize.height * 0.08),
                _isLoading
                    ? const Center(
                  child: CircularProgressIndicator(color: Color(0xFF9D2FBA)),
                )
                    :CustomButton(
                  label: 'تغيير كلمة السر',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_passwordController.text != _confirmPasswordController.text) {
                        _showSnackBar('كلمة السر وتأكيد كلمة السر غير متطابقتين');
                        return;
                      }

                      setState(() => _isLoading = true);

                      Future.delayed(const Duration(seconds: 3), () {
                        setState(() => _isLoading = false);
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => const SuccessPage()),
                        );
                      });
                    }
                  },
                )
              ],
            ),
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
