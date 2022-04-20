import 'package:flutter/material.dart';

class Allvalidators {
  static String email = '';
  static String? emailValidator(String? content) {
    email = content!;
    debugPrint('ADDED EMAIL TO CHECK IT >>> $email');
    if (content.isEmpty) {
      return 'fill the gap';
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(content)) {
      return 'missing @';
    }
    return null;
  }

  static String? passwordValidator(String? content) {
    if (content!.length < 8) {
      return 'must have 8 letters at least';
    } else if (content.isEmpty) {
      return 'fill the gap';
    }
    return null;
  }

  static String? nameValidator(String? content) {
    if (content!.isEmpty) {
      return 'fill the gap';
    } else if (content.length < 7) {
      return 'enter your fullname';
    }
    return null;
  }

  static String? dateOfbirth(String? content) {
    if (content!.isEmpty) {
      return 'enter year / month / day';
    }
    return null;
  }

  static String? secondEmailValidator(String? content) {
    debugPrint("INPUT EMAIL >>$content\nOLD EMAIL $email");
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(content!)) {
      return 'missing @';
    } else if (content != email) {
      debugPrint(email.toString());
      return 'check the email is the same with yours';
    }
    return null;
  }
}
