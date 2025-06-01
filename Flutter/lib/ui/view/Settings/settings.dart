import 'package:fl/ui/shared/custom_bottom_bar.dart';
import 'package:fl/ui/view/ChangePassword/ResetPassword/reset_password.dart';
import 'package:flutter/material.dart';

import 'package:flutter_switch/flutter_switch.dart';


class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool notificationsEnabled = true;
  final String studentName = 'عيسى ابراهيم';
  final String classInfo = 'صف 10 شعبة 2';

  String phoneNumber = '0912345678';
  String email = 'example@email.com';

  void showEditDialog({
    required String title,
    required String initialValue,
    required Function(String) onConfirm,
  }) {
    final controller = TextEditingController(text: initialValue);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color.fromRGBO(106, 70, 168, 1), // ← لون الخلفية الجديد
        title: Text('تعديل $title' , style: TextStyle(
          color: Colors.white
        ),),
        content: TextField(
          controller: controller,
          keyboardType: title == "رقم الهاتف"
              ? TextInputType.phone
              : TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: title,
            border: const OutlineInputBorder(),
          ),
        ),
        actions: [
          Row(
            children: [
              TextButton(
                onPressed: () {
                  final newValue = controller.text.trim();
                  if (newValue.isEmpty) return;
                  onConfirm(newValue);
                  Navigator.pop(context);
                },
                child: const Text('تأكيد' ,
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('إلغاء',
                  style: TextStyle(
                      color: Colors.white
                  ),),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 0,
        highlightActiveItem: false,
      ),
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2F2F2),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenSize.width * (8 / 430),
            ),
            child: Row(
              children: [
                SizedBox(width: screenSize.width * (70 / 430)),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * (24 / 430),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenSize.height * (24 / 932)),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'الإعدادات',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: screenSize.width * (24 / 430),
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * (24 / 932)),
          
              // معلومات الطالب
              Row(
                children: [
                  Image.asset('assets/images/Profile1.png'),
                  SizedBox(width: screenSize.width * (16 / 430)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        studentName,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: screenSize.width * (16 / 430),
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: screenSize.height * (10 / 932)),
                      Text(
                        classInfo,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: screenSize.width * (16 / 430),
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'تعديل الملف',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: screenSize.width * (16 / 430),
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenSize.height * (40 / 932)),
              Row(
                children: [
                  Image.asset('assets/Icons/Icon (11).png'),
                  SizedBox(width: screenSize.width * (8 / 430)),
                  Text(
                    'الإشعارات',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: screenSize.width * (16 / 430),
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: screenSize.width * (200 / 430)),

                  FlutterSwitch(
                    width: 60.0,
                    height: 30.0,
                    toggleSize: 25.0,
                    value: notificationsEnabled,
                    borderRadius: 20,
                    activeColor: Color.fromRGBO(106, 70, 168, 1),
                    // rgba(106, 70, 168, 1)
                    inactiveColor: Colors.grey,
                    padding: 4.0,
                    // showOnOff: true,
                    onToggle: (val) {
                      setState(() {
                        notificationsEnabled = val;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: screenSize.height * (32 / 932)),
              Row(
                children: [
                  const Icon(Icons.phone_outlined, color: Colors.grey),
                  SizedBox(width: screenSize.width * (16 / 430)),
                  Expanded(
                    child: Text(
                      phoneNumber,
                      style: TextStyle(
                        fontSize: screenSize.width * 0.045,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit, color: Color.fromRGBO(66, 66, 66, 1)),
                    onPressed: () {
                      showEditDialog(
                        title: 'رقم الهاتف',
                        initialValue: phoneNumber,
                        onConfirm: (newNumber) {
                          setState(() {
                            phoneNumber = newNumber;
                          });
                        },
                      );
                    },
                  ),
                ],
              ),
              const Divider(thickness: 1, color: Colors.black),
              Row(
                children: [
                  const Icon(Icons.email_outlined, color: Colors.grey),
                  SizedBox(width: screenSize.width * (16 / 430)),
                  Expanded(
                    child: Text(
                      email,
                      style: TextStyle(
                        fontSize: screenSize.width * 0.045,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit, color: Color.fromRGBO(66, 66, 66, 1)),
                    onPressed: () {
                      showEditDialog(
                        title: 'البريد الإلكتروني',
                        initialValue: email,
                        onConfirm: (newEmail) {
                          setState(() {
                            email = newEmail;
                          });
                        },
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: screenSize.height * (32 / 932)),
              Row(
                children: [
                  const Text('تغيير كلمة السر'),
                  SizedBox(width: screenSize.width * (200 / 430)),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const ResetPassword()),
                      );
                    },
                    icon: const Icon(Icons.arrow_forward_ios),
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
