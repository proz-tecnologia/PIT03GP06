import 'package:flutter/material.dart';

class TextStyles {
  static TextStyles? _instance;

  TextStyles._();

  static TextStyles get i {
    _instance ??= TextStyles._();
    return _instance!;
  }

  String get font => 'mplus1';

  TextStyle get textRegular =>
      TextStyle(fontWeight: FontWeight.normal, fontFamily: font);
  TextStyle get textBold =>
      TextStyle(fontWeight: FontWeight.bold, fontFamily: font);
  TextStyle get textTitle =>
      textBold.copyWith(fontSize: 23, color: Colors.white);
}

extension TextStyleExtensions on BuildContext {
  TextStyles get textStyles => TextStyles.i;
}
