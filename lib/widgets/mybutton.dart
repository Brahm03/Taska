import 'package:flutter/material.dart';
import 'package:taska/core/constants/colorConst.dart';
import 'package:taska/core/constants/fontSizeconst.dart';
import 'package:taska/core/constants/radiusConst.dart';

class Mybutton extends StatelessWidget {
  final Color buttonColor;
  final String text;
  final Color textcolor;
  final VoidCallback onPressed;
  final double width;
  final double height;
  const Mybutton(
      {this.width = 250,
      this.height = 50,
      required this.onPressed,
      required this.textcolor,
      required this.buttonColor,
      required this.text,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shadowColor: ColorConst.kPrimaryColor,
        elevation: 10,
        fixedSize: Size(width, height),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(RadiusConst.large)),
        primary: buttonColor,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            fontSize: FontSizeconst.medium,
            color: textcolor,
            fontFamily: 'myfont'),
      ),
    );
  }
}
