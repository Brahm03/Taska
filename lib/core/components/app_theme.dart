import 'package:flutter/material.dart';
import 'package:taska/core/constants/colorConst.dart';

class Apptheme {
  static get dark => ThemeData(
    brightness: Brightness.dark,
    primaryColor: ColorConst.kPrimaryColor
  );
  static get light => ThemeData(
    brightness: Brightness.light,
    primaryColor: ColorConst.kPrimaryColor
  );
}
