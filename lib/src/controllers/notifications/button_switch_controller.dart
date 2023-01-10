import 'package:flutter/material.dart';

class ButtonSwitchController extends ChangeNotifier {
  bool isNotificationEnabled = true;
  bool isSoundEnabled = true;

  changeNotificationState() {
    isNotificationEnabled = !isNotificationEnabled;
    notifyListeners();
  }

  changeSoundState() {
    isSoundEnabled = !isSoundEnabled;
    notifyListeners();
  }
}





// import 'package:flutter/material.dart';
//
// class ButtonSwitchController extends ChangeNotifier {
//   bool isNotificationEnabled = true;
//   bool isSoundEnabled = true;
//
//   changeNotificationState(value) {
//     value = !isNotificationEnabled;
//     notifyListeners();
//   }
//
//   changeButtonSound(value) {
//     value = !isSoundEnabled;
//     if (isNotificationEnabled == false) {
//       isSoundEnabled == false;
//     }
//     notifyListeners();
//   }
// }
