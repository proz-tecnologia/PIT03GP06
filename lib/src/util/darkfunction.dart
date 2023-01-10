import 'package:ctrl_real/src/controllers/themes_controller.dart';
import 'package:flutter/material.dart';

Color darkFunctionTexts() {
  return DarkController.instance.darkmod
      ? const Color.fromARGB(207, 255, 255, 255)
      : DarkController.instance.bluemod
          ? const Color.fromARGB(255, 65, 105, 225)
          : DarkController.instance.redmod
              ? const Color.fromARGB(220, 219, 37, 27)
              : DarkController.instance.greenmod
                  ? Colors.green
                  : const Color.fromARGB(220, 104, 89, 205);
}

Color textUser() {
  return const Color.fromARGB(207, 255, 255, 255);
}

Color textCardColors(String? cor) {
  return DarkController.instance.darkmod
      ? cor == null
          ? const Color.fromARGB(255, 20, 195, 26)
          : Colors.red
      : DarkController.instance.bluemod
          ? const Color.fromARGB(207, 255, 255, 255)
          : DarkController.instance.redmod
              ? const Color.fromARGB(207, 255, 255, 255)
              : DarkController.instance.greenmod
                  ? const Color.fromARGB(207, 255, 255, 255)
                  : cor == null
                      ? const Color.fromARGB(255, 20, 195, 26)
                      : Colors.red;
}

Color darkFunctionWidgets() {
  return DarkController.instance.darkmod
      ? const Color.fromARGB(213, 19, 19, 19)
      : DarkController.instance.bluemod
          ? const Color.fromARGB(255, 65, 105, 225)
          : DarkController.instance.redmod
              ? const Color.fromARGB(220, 219, 37, 27)
              : DarkController.instance.greenmod
                  ? Colors.green
                  : const Color.fromARGB(220, 104, 89, 205);
}

Color darkFunctionSelected() {
  return DarkController.instance.darkmod
      ? const Color.fromARGB(220, 104, 89, 205)
      : DarkController.instance.bluemod
          ? const Color.fromARGB(255, 65, 105, 225)
          : DarkController.instance.redmod
              ? const Color.fromARGB(220, 219, 37, 27)
              : DarkController.instance.greenmod
                  ? Colors.green
                  : const Color.fromARGB(220, 104, 89, 205);
}

Color darkFunctionFloat() {
  return DarkController.instance.darkmod
      ? const Color.fromARGB(220, 104, 89, 205)
      : DarkController.instance.bluemod
          ? const Color.fromARGB(255, 65, 105, 225)
          : DarkController.instance.redmod
              ? const Color.fromARGB(220, 219, 37, 27)
              : DarkController.instance.greenmod
                  ? Colors.green
                  : const Color.fromARGB(220, 104, 89, 205);
}

Color supermercColorIndicator() {
  return DarkController.instance.darkmod
      ? const Color(0xff8D32E3)
      : DarkController.instance.bluemod
          ? const Color.fromARGB(255, 24, 27, 224)
          : DarkController.instance.redmod
              ? const Color.fromARGB(255, 255, 192, 74)
              : DarkController.instance.greenmod
                  ? const Color.fromARGB(255, 95, 249, 236)
                  : const Color(0xff8D32E3);
}

Color transporColorIndicator() {
  return DarkController.instance.darkmod
      ? const Color(0xffD841E8)
      : DarkController.instance.bluemod
          ? const Color.fromARGB(255, 81, 252, 229)
          : DarkController.instance.redmod
              ? const Color.fromARGB(255, 222, 143, 58)
              : DarkController.instance.greenmod
                  ? const Color.fromARGB(255, 83, 219, 169)
                  : const Color(0xffD841E8);
}

Color pagColorIndicator() {
  return DarkController.instance.darkmod
      ? const Color(0xff845bef)
      : DarkController.instance.bluemod
          ? const Color.fromARGB(255, 90, 188, 224)
          : DarkController.instance.redmod
              ? const Color.fromARGB(255, 245, 133, 77)
              : DarkController.instance.greenmod
                  ? const Color.fromARGB(255, 98, 245, 157)
                  : const Color(0xff845bef);
}

Color lazerColorIndicator() {
  return DarkController.instance.darkmod
      ? const Color(0xff4964B8)
      : DarkController.instance.bluemod
          ? const Color.fromARGB(255, 90, 144, 245)
          : DarkController.instance.redmod
              ? const Color.fromARGB(255, 222, 83, 58)
              : DarkController.instance.greenmod
                  ? const Color.fromARGB(255, 78, 222, 85)
                  : const Color(0xff4964B8);
}

Color farmacColorIndicator() {
  return DarkController.instance.darkmod
      ? const Color(0xff2C25FA)
      : DarkController.instance.bluemod
          ? const Color.fromARGB(255, 76, 71, 222)
          : DarkController.instance.redmod
              ? const Color.fromARGB(255, 252, 66, 82)
              : DarkController.instance.greenmod
                  ? const Color.fromARGB(255, 148, 252, 88)
                  : const Color(0xff2C25FA);
}

Color gastosexColorIndicator() {
  return DarkController.instance.darkmod
      ? const Color.fromARGB(255, 91, 0, 152)
      : DarkController.instance.bluemod
          ? const Color.fromARGB(255, 111, 0, 255)
          : DarkController.instance.redmod
              ? const Color.fromARGB(255, 255, 23, 11)
              : DarkController.instance.greenmod
                  ? const Color.fromARGB(255, 65, 132, 27)
                  : const Color.fromARGB(255, 91, 0, 152);
}
