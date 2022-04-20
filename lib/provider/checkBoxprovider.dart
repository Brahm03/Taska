import 'package:flutter/material.dart';

class CheckBoxprovider extends ChangeNotifier {
  bool ckecked = false;

  onChanged() {
    ckecked = !ckecked;
    debugPrint(ckecked.toString());
    notifyListeners();
  }
}
