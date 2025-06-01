import 'package:flutter/material.dart';
import '../../view/school_activity_model.dart';

class SchoolActCont extends StatefulWidget {
  final List<SchoolActivity> filteredActivities;

  const SchoolActCont({
    super.key,
    required this.filteredActivities,
    required List activities,
  });

  @override
  State<SchoolActCont> createState() => _SchoolActContState();
}

class _SchoolActContState extends State<SchoolActCont> {
  void _showCustomPhoneDialog(String title) {
    final TextEditingController phoneController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        final screenSize = MediaQuery.of(context).size;

        return Dialog(
          backgroundColor: const Color.fromRGBO(106, 70, 168, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: EdgeInsets.all(screenSize.width * (16 / 430)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenSize.width * (20 / 430),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenSize.height * (16 / 932)),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(123, 47, 247, 0.25), // ظل ناعم
                        blurRadius: 10,
                        offset: const Offset(0, 4), // ظل للأسفل قليلاً
                        // rgba(123, 47, 247, 0.25)
                      ),
                    ],
                    color: const Color.fromRGBO(218, 197, 253, 0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding:
                  EdgeInsets.symmetric(horizontal: screenSize.height * (16 / 932)),
                  child: TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    style:
                    const TextStyle(color: Color.fromRGBO(36, 36, 36, 1)),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'رقم هاتفك',
                      hintStyle: TextStyle(color: Colors.black54),
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * (30 / 932)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: screenSize.width * (10 / 430)),
                    InkWell(
                      onTap: () {
                        String phone = phoneController.text.trim();

                        bool isValid = phone.length == 10 && phone.startsWith('09');

                        if (!isValid) {
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(this.context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'يرجى إدخال رقم صحيح يبدأ بـ 09 ويتكون من 10 أرقام.'),
                              backgroundColor: Colors.redAccent,
                            ),
                          );
                          return;
                        }

                        Navigator.of(context).pop(); // إغلاق ديالوج الرقم

                        _showLoadingDialog(() {
                          _showSuccessDialog();
                        });

                        print('رقم الهاتف: $phone');
                      },
                      child: Text(
                        'اشترك',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenSize.width * (16 / 430),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(width: screenSize.width * (36 / 430)),
                    InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: Text(
                        'إلغاء',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenSize.width * (16 / 430),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenSize.height * (30 / 932)),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showLoadingDialog(VoidCallback onComplete) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        Future.delayed(const Duration(seconds: 5), () {
          Navigator.of(dialogContext).pop(); // إغلاق دائرة الانتظار
          onComplete(); // استدعاء ديالوج النجاح
        });

        return const Center(
          child: CircularProgressIndicator(color:  Color.fromRGBO(106, 70, 168, 1)),
        );
      },
    );
  }

  void _showSuccessDialog() {
    final screenSize = MediaQuery.of(context).size;
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Color.fromRGBO(106, 70, 168, 1),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: EdgeInsets.all(screenSize.width * (20 / 430)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/illustration (1).png',
                  height: screenSize.height * (136 / 932),
                  width: screenSize.width*(136/430),
                    // rgba(106, 70, 168, 1)
                ),
                SizedBox(height: screenSize.height * (24 / 932)),
                Text(
                  'تم الاشتراك بنجاح!',
                  style: TextStyle(
                    fontSize: screenSize.width * (18 / 430),
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
                SizedBox(height: screenSize.height * (24 / 932)),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return ListView.builder(
      itemCount: widget.filteredActivities.length,
      itemBuilder: (context, index) {
        final activity = widget.filteredActivities[index];
        final isRuwad = activity.type == 'الرواد';

        return Container(
          width: screenSize.width * (382 / 430),
          height: screenSize.height * (150 / 932),
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: EdgeInsets.all(screenSize.width * (8 / 430)),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(249, 249, 249, 1),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                spreadRadius: 1,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Padding(
                padding:
                EdgeInsets.symmetric(horizontal: screenSize.width * (8 / 430)),
                child: Image.asset(
                  activity.imagePath,
                  width: screenSize.width * (72 / 430),
                  height: screenSize.height * (72 / 932),
                ),
              ),
              SizedBox(width: screenSize.width * (8 / 430)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      activity.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenSize.width * (16 / 430),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      activity.date,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      activity.description,
                      style:
                      const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              if (isRuwad)
                CustomButton2(
                  label: 'شارك الآن',
                  onPressed: () => _showCustomPhoneDialog(activity.title),
                ),
            ],
          ),
        );
      },
    );
  }
}

class CustomButton2 extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CustomButton2({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: screenSize.height * (31 / 932),
        width: screenSize.width * (89 / 430),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(123, 47, 247, 1),
              Color.fromRGBO(166, 99, 204, 1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: screenSize.width * (12 / 430),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
