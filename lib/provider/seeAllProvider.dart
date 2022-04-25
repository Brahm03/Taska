import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taska/provider/writeUserInfoProvider.dart';

class SeeAllProvider extends ChangeNotifier {
  bool isall = false;

  seeAllTap(BuildContext context) {
    isall = !isall;
    context.read<UserInfoProvider>().refresh();
    notifyListeners();
  }
}
