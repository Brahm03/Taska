import 'package:flutter/material.dart';

class Mysnackbar {
  static showmysnack({required BuildContext context,required String text,required Color color}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: const TextStyle(fontFamily: 'myfont', fontWeight: FontWeight.w400),
        ),
        backgroundColor: color,
      ),
    );
  }
}
