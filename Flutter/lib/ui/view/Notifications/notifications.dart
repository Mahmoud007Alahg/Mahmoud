import 'package:fl/ui/shared/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool markAllAsOld = false;

  List<Map<String, dynamic>> notifications = [
    {
      'title': 'تمت صدور علامات مذاكرة الرياضيات !',
      'duration': 'منذ: 5 دقائق',
      'isNew': true,
    },
    {
      'title': 'التزامًا بقوانين وزارة التربية نعلن عن عطلة رسمية الأسبوع القادم.',
      'duration': 'منذ: 3 أيام',
      'isNew': false,
    },
    {
      'title': 'انتهاء أعمال الصيانة في مخبر الكيمياء',
      'duration': 'منذ: 5 دقائق',
      'isNew': true,
    },
    {
      'title': 'انتهاء أعمال الصيانة في مركز المعلوماتية و تم إضافة أجهزة جديدة',
      'duration': 'منذ: أسبوع ',
      'isNew': true,
    },
    // {
    //   'title': 'انتهاء أعمال الصيانة في مركز المعلوماتية و تم إضافة أجهزة جديدة',
    //   'duration': 'مدة: أسبوع ',
    //   'isNew': true,
    // }, {
    //   'title': 'انتهاء أعمال الصيانة في مركز المعلوماتية و تم إضافة أجهزة جديدة',
    //   'duration': 'مدة: أسبوع ',
    //   'isNew': true,
    // }, {
    //   'title': 'انتهاء أعمال الصيانة في مركز المعلوماتية و تم إضافة أجهزة جديدة',
    //   'duration': 'مدة: أسبوع ',
    //   'isNew': true,
    // }, {
    //   'title': 'انتهاء أعمال الصيانة في مركز المعلوماتية و تم إضافة أجهزة جديدة',
    //   'duration': 'مدة: أسبوع ',
    //   'isNew': true,
    // }, {
    //   'title': 'انتهاء أعمال الصيانة في مركز المعلوماتية و تم إضافة أجهزة جديدة',
    //   'duration': 'مدة: أسبوع ',
    //   'isNew': true,
    // },
  ];

  void reloadNotifications() {
    setState(() {
      notifications = [
        {
          'title': 'تمت صدور علامات مذاكرة الرياضيات !',
          'duration': 'منذ: 5 دقائق',
          'isNew': true,
        },
        {
          'title': 'التزامًا بقوانين وزارة التربية نعلن عن عطلة رسمية الأسبوع القادم.',
          'duration': 'منذ: 3 أيام',
          'isNew': false,
        },
        {
          'title': 'انتهاء أعمال الصيانة في مخبر الكيمياء',
          'duration': 'منذ: 5 دقائق',
          'isNew': true,
        },
        {
          'title': 'انتهاء أعمال الصيانة في مركز المعلوماتية و تم إضافة أجهزة جديدة',
          'duration': 'منذ: أسبوع ',
          'isNew': true,
        },
      ];
    });
  }


  @override
  void dispose() {
    markAllAsOld = true;
    super.dispose();
  }

  void removeNotification(int index) {
    setState(() {
      notifications.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(
        highlightActiveItem: false,
        currentIndex: 0,
      ),
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2F2F2),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenSize.width * (8 / 430),
            ),
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_forward),
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: screenSize.height * (40 / 932)),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenSize.width * (24 / 430)),
                child: Text(
                  'الإشعارات',
                  style: TextStyle(
                    fontSize: screenSize.width * (24 / 430),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenSize.height * (40 / 932)),
            notifications.isEmpty
                ? Padding(
              padding: EdgeInsets.only(top: screenSize.height * 0.2),
              child: Column(
                children: [
                  const Text(
                    'لا يوجد إشعارات جديدة',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: reloadNotifications,
                    child: Container(
                      height: screenSize.height * (56 / 932),
                      width: screenSize.width * (200 / 430),
                      // rgba(123, 47, 247, 0.25)
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromRGBO(123, 47, 247, 0.25),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8),
                        gradient: LinearGradient(
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
                          'إعادة تحميل الإشعارات',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenSize.width * (18 / 430),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
                : Column(
              children: List.generate(notifications.length, (index) {
                final notif = notifications[index];
                return NotificationsCard(
                  initiallyNew: notif['isNew'],
                  forceOld: markAllAsOld,
                  title: notif['title'],
                  duration: notif['duration'],
                  onDelete: () => removeNotification(index),
                );
              }),
            ),

          ],
        ),
      ),
    );
  }
}

class NotificationsCard extends StatefulWidget {
  final String title;
  final String duration;
  final bool initiallyNew;
  final bool forceOld;
  final VoidCallback? onDelete;

  const NotificationsCard({
    super.key,
    required this.initiallyNew,
    required this.title,
    required this.duration,
    this.forceOld = false,
    this.onDelete,
  });

  @override
  State<NotificationsCard> createState() => _NotificationsCardState();
}

class _NotificationsCardState extends State<NotificationsCard> {
  late bool isNew;

  @override
  void initState() {
    super.initState();
    isNew = widget.initiallyNew;
  }

  @override
  void didUpdateWidget(covariant NotificationsCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.forceOld && isNew) {
      setState(() {
        isNew = false;
      });
    }
  }

  void handleTap() {
    if (isNew) {
      setState(() {
        isNew = false;
      });
    }
  }

  void handleMenuAction(String value) {
    if (value == 'delete' && widget.onDelete != null) {
      widget.onDelete!();
    } else if (value == 'pin') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تم تثبيت الإشعار')),
      );
    } else if (value == 'ignore') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تم تحديد الإشعار كغير مهم')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: handleTap,
      child: Container(
        padding: EdgeInsets.all(screenSize.width * (12 / 430)),
        decoration: BoxDecoration(
          color: isNew
              ? const Color.fromRGBO(218, 197, 253, 0.5)
              : const Color(0xFFF2F2F2),
          // borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/Icons/School.png',
              width: screenSize.width * (48 / 430),
              height: screenSize.height * (48 / 932),
            ),
            SizedBox(width: screenSize.width * (12 / 430)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: screenSize.width * (14 / 430),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenSize.height * (4 / 932)),
                  Text(
                    widget.duration,
                    style: TextStyle(
                      fontSize: screenSize.width * (12 / 430),
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 5,
              left: 0,
              child: PopupMenuButton<String>(
                icon: const Icon(Icons.more_horiz),
                onSelected: handleMenuAction,
                itemBuilder: (context) => const [
                  PopupMenuItem(value: 'delete', child: Text('حذف')),
                  PopupMenuItem(value: 'pin', child: Text('تثبيت')),
                  PopupMenuItem(value: 'ignore', child: Text('غير مهتم')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
