import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../shared/CustomWidget/custom-button.dart';
import '../NewPassword/new_password.dart';
// import '../ResetPassword/reset_password.dart';

class ConfirmCode extends StatefulWidget {
  const ConfirmCode({super.key});

  @override
  State<ConfirmCode> createState() => _ConfirmCodeState();
}

class _ConfirmCodeState extends State<ConfirmCode> {
  final _formKey = GlobalKey<FormState>();
  final _pinController = TextEditingController();
  final _correctCode = "12345";
  String? _errorMessage;

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   backgroundColor: const Color(0xFFF2F2F2),
      //   automaticallyImplyLeading: false,
      //   actions: [
      //     IconButton(
      //       onPressed: () => Navigator.of(context).pop(),
      //       icon: const Icon(Icons.arrow_forward_sharp),
      //     ),
      //   ],
      // ),
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
            padding: EdgeInsets.symmetric(horizontal: screenSize.width * (24/430) , vertical: screenSize.height*(80/932)),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/forgot password illustration (1).png',
                      width: screenSize.width * (136/430),
                      height: screenSize.height * (136/932),
                    ),
                  ),
                  SizedBox(height: screenSize.height * (56/932)),
                  _buildTitleText('افحص صندوق البريد', bold: true),
                  SizedBox(height: screenSize.height * (32/932)),
                  _buildTitleText(
                    'ادخل الكود الذي وصل إلى بريدك\nالإلكتروني، تأكد من عدم إرساله إلى أحد.',
                  ),
                  SizedBox(height: screenSize.height * (56/932)),
                  _buildPinCodeField(),
                  SizedBox(height: screenSize.height * (80/932)),
                  CustomButton(
                    label: 'التحقق من الكود',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _verifyCode(_pinController.text);
                      }
                    },
                  ),
                  SizedBox(height: screenSize.height * 0.03),
                  _buildResendText(),
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
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        text,
        textAlign: TextAlign.right,
        style: TextStyle(
          fontSize: screenSize.width*(24/430),
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          color: const Color(0xFF454545),
        ),
      ),
    );
  }

  Widget _buildPinCodeField() {
    return Column(
      children: [
        PinCodeTextField(
          appContext: context,
          cursorColor: Color.fromRGBO(123, 47, 247, 0.4),
          length: 5,
          controller: _pinController,
          animationType: AnimationType.fade,
          keyboardType: TextInputType.number,
        onCompleted: (value) {
          if (value.isNotEmpty && value != _correctCode) {
            setState(() {
              _errorMessage = 'رمز التأكيد غير صحيح.';
            });
          } else {
            setState(() {
              _errorMessage = null;
            });
          }
        },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'يرجى إدخال كود التحقق';
            }
            return null;
          },
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.underline,
            inactiveColor: Colors.grey,
            activeColor: Color.fromRGBO(123, 47, 247, 0.25),
            selectedColor: Color.fromRGBO(123, 47, 247, 0.25),
              // rgba(123, 47, 247, 0.25)
          ),
          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        // SizedBox(height: 6),
        if (_errorMessage != null)
          Align(
            alignment: Alignment.center,
            child: Text(
              _errorMessage!,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildResendText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('لم يصلك الكود بعد؟ '),
        TextButton(
          onPressed: () {},
          child: const Text(
            'إعادة إرسال الكود',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ],
    );
  }

  void _verifyCode(String code) {
    if (code == _correctCode) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const NewPassword()),
      );
    } else {
      setState(() {
        _errorMessage = 'رمز التأكيد غير صحيح.';
      });
    }
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
