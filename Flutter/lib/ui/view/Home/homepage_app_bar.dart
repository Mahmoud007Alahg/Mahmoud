import 'package:flutter/material.dart';
import '../../../core/services/notifications_provider.dart';
import '../Notifications/notifications.dart';
import 'package:provider/provider.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: const Center(
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'مدرسة المتفوقين',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
      actions: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.black),
              onPressed: () async {
                // إخفاء الإشعار عند فتح الصفحة
                context.read<NotificationProvider>().setHasNotifications(false);
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Notifications(),
                  ),
                );
              },
            ),
            if (context.watch<NotificationProvider>().hasNotifications)
              Positioned(
                right: 12,
                top: 12,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.purple,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
