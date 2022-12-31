import 'package:ctrl_real/src/controllers/themes/darmodcontroller.dart';
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
