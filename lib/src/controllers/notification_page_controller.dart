import 'package:flutter/material.dart';

class NotificationPageController extends ChangeNotifier {
  bool isNotificationEnabled = true;
  bool isSoundEnabled = true;

  static NotificationPageController instance = NotificationPageController();

  changeNotificationState() {
    isNotificationEnabled = !isNotificationEnabled;
    notifyListeners();
  }

  changeSoundState() {
    isSoundEnabled = !isSoundEnabled;
    notifyListeners();
  }
}
