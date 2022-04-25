import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taska/core/constants/IconConst.dart';
import 'package:taska/core/constants/PM_const.dart';
import 'package:taska/core/constants/colorConst.dart';
import 'package:taska/core/constants/radiusConst.dart';

class AllStyles {
  static InputDecoration textformFieldStyle({Widget preficIcon = const SizedBox(),required String hinttext,required Widget icon}) {
    return InputDecoration(
      floatingLabelAlignment: FloatingLabelAlignment.start,
      focusColor: ColorConst.kPrimaryColor,
      contentPadding: PMconst.medium,
      suffixIcon: Padding(padding: const EdgeInsets.all(10),child: preficIcon),
      hintText: hinttext,
      filled: true,
      hintStyle: const TextStyle(fontFamily: 'myfont', color: ColorConst.darkgrey),
      prefixIcon: Padding(padding: const EdgeInsets.all(10),child: icon),
      fillColor: ColorConst.grey,
      border: OutlineInputBorder(
        gapPadding: 10,
        borderRadius: BorderRadius.circular(RadiusConst.small),
        borderSide: const BorderSide(color: Colors.white, width: 10)
      )
    );
  }
}
