import 'package:flutter/material.dart';

class DarkController extends ChangeNotifier {
  bool darkmod = false;
  bool bluemod = false;
  bool redmod = false;
  bool greenmod = false;

  static DarkController instance = DarkController();

  changeTheme() {
    darkmod = !darkmod;
    notifyListeners();
  }

  changeThemeBlue() {
    bluemod = !bluemod;
    notifyListeners();
  }

  changeThemeRed() {
    redmod = !redmod;
    notifyListeners();
  }

  changeThemeGreen() {
    greenmod = !greenmod;
    notifyListeners();
  }
}
