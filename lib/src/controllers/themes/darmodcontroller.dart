import 'package:flutter/material.dart';

class DarkController extends ChangeNotifier {
  bool darkmod = false;

  static DarkController instance = DarkController();

  changeTheme() {
    darkmod = !darkmod;
    notifyListeners();
  }
}

class ButtonDark extends StatefulWidget {
  const ButtonDark({super.key});

  @override
  State<ButtonDark> createState() => _ButtonDarkState();
}

class _ButtonDarkState extends State<ButtonDark> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: DarkController.instance.darkmod,
      onChanged: (value) {
        setState(() {
          DarkController.instance.changeTheme();
        });
      },
    );
  }
}
