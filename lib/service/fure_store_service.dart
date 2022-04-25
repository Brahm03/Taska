import 'package:flutter/material.dart';
import 'package:taska/service/FirebaseService.dart';

class MyFireStore {
  static Map<String, dynamic> infoOfUser = {};
  static Map<String, dynamic> myData = {};
  static Future<Map<String, dynamic>> getData() async {
    try {
      await FirebaseService.store
          .collection('user')
          .doc(FirebaseService.auth.currentUser!.email)
          .get()
          .then((value) {
        myData = value.data()!;
        infoOfUser.addAll(myData);
      });
      return myData;
    } catch (e) {
      return myData;
    }
  }
}
