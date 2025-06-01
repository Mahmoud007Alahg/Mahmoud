import 'package:flutter/material.dart';
import 'package:fl/ui/shared/CustomWidget/custom-text-form-field.dart';
import 'package:fl/ui/shared/CustomWidget/custom_text_form_field_3.dart';
import 'package:fl/ui/view/ChangePassword/ResetPassword/reset_password.dart';
import '../../../core/services/api_services.dart';
import '../../shared/CustomWidget/custom-button.dart';
import '../ContantUs/contant_us.dart';
import '../Home/home_screen.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ApiService _apiService = ApiService();
  bool _isObscured = true;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _userIdController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          _buildBackgroundImages(screenSize),
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.06),
                  child: Column(
                    children: [
                      SizedBox(height: screenSize.height * (56/932)),
                      Image.asset(
                        'assets/images/Logo (1).png',
                        width: screenSize.width * (199 / 430),
                        height: screenSize.height * (199 / 932),
                      ),
                      const SizedBox(height: 10),
                      _buildTitleText('أهلًا وسهلًا بك'),
                      _buildTitleText('قم بتسجيل الدخول إلى حسابك'),
                      SizedBox(height: screenSize.height * (61 / 932)),
                      _buildLoginForm(),
                      SizedBox(height: screenSize.height * (16/932)),
                    ],
                  ),
                ),
              ),
              _buildBottomButtons(screenSize),
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

  Widget _buildLoginForm() {
    final screenSize = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField3(
            controller: _userIdController,
            hintText: 'المعرف الخاص بك',
            prefixIcon: Icons.credit_card,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'الرجاء إدخال المعرف الخاص بك';
              }
              return null;
            },
          ),
          SizedBox(height: screenSize.height * (16/932)),
          CustomTextFormField(
            controller: _passwordController,
            hintText: 'كلمة السر',
            icon: _isObscured ? Icons.visibility_off_outlined : Icons.visibility_outlined,
            obscureText: _isObscured,
            onIconPressed: () => setState(() => _isObscured = !_isObscured),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'الرجاء إدخال كلمة السر';
              }
              return null;
            },
          ),
          if (_errorMessage != null)
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenSize.height*(10/932)),
              child: Text(
                _errorMessage!,
                style: TextStyle(
                    color: Colors.red,
                    fontSize: screenSize.width*(16/430),
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildBottomButtons(Size screenSize) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('هل نسيت كلمة السر؟', style: TextStyle(
                fontSize: screenSize.width*(12/430),
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(40, 40, 40, 1)
            )),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const ResetPassword())
                  );
                },
                child: Text('اعادة تعيين', style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: screenSize.width*(12/430),
                    color: const Color.fromRGBO(106, 70, 168, 1)
                ))
            )
          ],
        ),
        _isLoading
            ? const CircularProgressIndicator(color: Color.fromRGBO(157, 47, 186, 1))
            : CustomButton(
          label: 'تسجيل الدخول',
          onPressed: _loginWithApi,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ليس لديك حساب؟', style: TextStyle(
                fontSize: screenSize.width*(12/430),
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(40, 40, 40, 1)
            )),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const ContantUs())
                  );
                },
                child: Text('تواصل معنا', style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: screenSize.width*(12/430),
                    color: const Color.fromRGBO(106, 70, 168, 1)
                ))
            )
          ],
        ),
        SizedBox(height: screenSize.height*(60/932))
      ],
    );
  }

  Future<void> _loginWithApi() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });

      try {
        final response = await _apiService.loginUser(
          _userIdController.text.trim(),
          _passwordController.text.trim(),
        );

        if (response['success'] == true) {
          // تخزين token إذا كان موجوداً في الresponse
          // final token = response['token'];
          // await SecureStorage.saveToken(token);

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        } else {
          setState(() {
            _errorMessage = response['message'] ?? 'فشل تسجيل الدخول';
          });
        }
      } catch (e) {
        setState(() {
          _errorMessage = e.toString().contains('فشل تسجيل الدخول')
              ? e.toString().replaceFirst('Exception: ', '')
              : 'حدث خطأ في الاتصال بالخادم';
        });
      } finally {
        if (mounted) {
          setState(() => _isLoading = false);
        }
      }
    }
  }

  Widget _buildTitleText(String text) {
    final screenSize = MediaQuery.of(context).size;
    return Text(
      text,
      style: TextStyle(
        fontSize: screenSize.width * (24 / 430),
        fontWeight: FontWeight.w700,
        color: const Color(0xFF262626),
      ),
    );
  }
}