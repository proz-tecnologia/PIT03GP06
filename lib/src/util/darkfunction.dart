import 'package:ctrl_real/src/controllers/themes/darmodcontroller.dart';
import 'package:flutter/material.dart';

Color darkFunctionTexts() {
  return DarkController.instance.darkmod
      ? const Color.fromARGB(207, 255, 255, 255)
      : const Color.fromARGB(220, 104, 89, 205);
}

Color darkFunctionWidgets() {
  return DarkController.instance.darkmod
      ? const Color.fromARGB(213, 19, 19, 19)
      : const Color.fromARGB(220, 104, 89, 205);
}
