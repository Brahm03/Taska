import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileImage extends ChangeNotifier {
  XFile? image;

  Future pickImage() async {
    try {
      image = await ImagePicker().pickImage(source: ImageSource.gallery);
      notifyListeners();
      if (image == null) {
        debugPrint('null');
        return;
      } else {
        notifyListeners();
        debugPrint('image');
        return image;
      }
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
  }
}
