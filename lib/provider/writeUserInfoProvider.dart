import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taska/service/FirebaseService.dart';

class UserInfoProvider extends ChangeNotifier {
  List tasks = [];
  Set temp = {};
  static String path = '';
  Future addIMGtoDB(
      {required XFile image, String foldername = 'avatars'}) async {
    try {
      var data = await FirebaseService.storage
          .ref()
          .child('pictures')
          .child(foldername)
          .child(DateTime.now().microsecond.toString())
          .putFile(File(image.path));
      path = await data.ref.getDownloadURL();
    } catch (e) {
      debugPrint('STORAGE ERROR >>>> $e');
    }
  }

  Future writeToDb(
      {required BuildContext context,
      required String email,
      required String fullname,
      required String birth,
      required String username}) async {
    try {
      await FirebaseService.store
          .collection('user')
          .doc(email.toLowerCase())
          .set({
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

  Future addTaskToDB(
      {required BuildContext context,
      required String title,
      required String date,
      required String description}) async {
    tasks.add({
      "pic": path,
      "do": false,
      "title": title,
      "description": description,
      "date": date,
      "added_time": DateTime.now(),
    });
    try {
      await FirebaseService.store
          .collection('user')
          .doc(FirebaseService.auth.currentUser!.email)
          .set({
        "tasks": tasks,
      }, SetOptions(merge: true));
      Navigator.pop(context);
      Navigator.pop(context);
      refresh();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future refresh() async {
    await FirebaseService.store
        .collection('user')
        .doc(FirebaseService.auth.currentUser!.email)
        .get()
        .then((value) {
      tasks = value.data()!['tasks'];
    });
  }

  Future changeDone(int index, context, bool change) async {
    try {
      tasks[index]['do'] = change;
      if (tasks[index]['do'] == true) {
        tasks[index]['do'].remove();
        await FirebaseService.store
            .doc(FirebaseService.auth.currentUser!.email.toString())
            .set({'tasks': tasks}, SetOptions(merge: true));
      }
    } catch (e) {
      print(e);
    }
    try {
      await FirebaseService.store
          .collection('user')
          .doc(FirebaseService.auth.currentUser!.email)
          .set({
        "tasks": tasks,
      }, SetOptions(merge: true));
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
    notifyListeners();
  }

  Future editProfilePic(XFile image) async {
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
    await FirebaseService.store
        .doc(FirebaseService.auth.currentUser!.email.toString())
        .set({
      'image_url': path,
    }, SetOptions(merge: true));
  }

  search(String input) {
    temp.clear();
    for (var i = 0; i < tasks.length; i++) {
      if (input.isEmpty) {
        temp.clear();
        notifyListeners();
      } else if (tasks[i]['title']
          .toString()
          .toLowerCase()
          .contains(input.toString().toLowerCase())) {
        debugPrint(tasks[i]['title']);
        temp.add(tasks[i]);
        notifyListeners();
      }
    }
  }

  Future delateFromStore(int index) async {
    try {
      if (tasks[index]['do'] == true) {
        tasks.removeAt(index);
        notifyListeners();
        await FirebaseService.store
            .doc(FirebaseService.auth.currentUser!.email.toString())
            .set({
          'tasks': tasks,
        }, SetOptions(merge: true));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
