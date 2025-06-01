import 'package:flutter/material.dart';

class NotificationProvider with ChangeNotifier {
  bool _hasNotifications = true;

  bool get hasNotifications => _hasNotifications;

  void setHasNotifications(bool value) {
    _hasNotifications = value;
    notifyListeners();
  }
}
