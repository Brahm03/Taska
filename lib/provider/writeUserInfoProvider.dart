import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taska/service/FirebaseService.dart';

class UserInfoProvider extends ChangeNotifier {
  static String path = '';
  Future addIMGtoDB(XFile image) async {
    try {
      var data = await FirebaseService.storage
          .ref()
          .child('pictures')
          .child('avatars')
          .child(DateTime.now().microsecond.toString())
          .putFile(File(image.path));
      path = await data.ref.getDownloadURL();
    } catch (e) {
      debugPrint('STORAGE ERROR >>>> $e');
    }
  }

  Future writeToDb(
      {required BuildContext context,required String email,
      required String fullname,
      required String birth,
      required String username}) async {
    try {
      await FirebaseService.store.collection('user').doc(email.toLowerCase()).set({
        "fullname": fullname,
        "username": username,
        "email": email,
        "birth": birth,
        "tasks": [],
        "image_url": path,
        "added_time": FieldValue.serverTimestamp(),
      });
      Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
    } catch (e) {
      debugPrint('ERROR IS HERE >>>>>> ${e.toString()}');
    }
  }
}
