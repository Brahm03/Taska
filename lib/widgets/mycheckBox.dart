import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taska/core/constants/colorConst.dart';
import 'package:taska/core/constants/fontSizeconst.dart';
import 'package:taska/provider/checkBoxprovider.dart';

class MycheckBox extends StatelessWidget {
  MycheckBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var checker = context.watch<CheckBoxprovider>();
    return Row(children: [
      Checkbox(
        value: checker.ckecked,
        onChanged: (v) {
          context.read<CheckBoxprovider>().onChanged();
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        focusColor: Colors.white,
        side: const BorderSide(color: ColorConst.kPrimaryColor, width: 2),
      ),
      const Text(
        'Remember me',
        style: TextStyle(
            fontFamily: 'myfont',
            fontSize: FontSizeconst.small,
            fontWeight: FontWeight.bold),
      )
    ]);
  }
}
