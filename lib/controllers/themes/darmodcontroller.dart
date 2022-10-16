import 'package:flutter/material.dart';

class DarkContoller extends ChangeNotifier{
   bool darkmod = false;

   static DarkContoller instance = DarkContoller();

   changeTheme(){
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
      value: DarkContoller.instance.darkmod,
      onChanged: (value) {
        setState(() {
          DarkContoller.instance.changeTheme();
        });    
      },
    );
  }
}