import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taska/core/constants/colorConst.dart';
import 'package:taska/core/constants/fontSizeconst.dart';
import 'package:taska/provider/checkBoxprovider.dart';

class MycheckBox extends StatelessWidget {
  bool value;
  var onchanged;
  MycheckBox({required this.onchanged,required this.value, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: onchanged,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      focusColor: Colors.white,
      side: const BorderSide(color: ColorConst.kPrimaryColor, width: 2),
    );
  }
}
