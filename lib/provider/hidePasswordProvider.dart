import 'package:flutter/material.dart';

class HidePasswordProvider extends ChangeNotifier {
  bool ishidden = true;

  onChane() {
    ishidden = !ishidden;
    notifyListeners();
  }
}
