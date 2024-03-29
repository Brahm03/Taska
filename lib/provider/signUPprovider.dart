import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taska/core/constants/colorConst.dart';
import 'package:taska/core/constants/radiusConst.dart';
import 'package:taska/service/FirebaseService.dart';
import 'package:taska/widgets/mysnackbar.dart';

class SignUpProvider extends ChangeNotifier {
  Future signUpwithEmail(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      showDialog(context: context, builder: (_)=> Center(
            child: SizedBox(height: MediaQuery.of(context).size.height * 0.2,child: LottieBuilder.asset('assets/icons/load.json')),
          ),
      );
      await FirebaseService.auth
          .createUserWithEmailAndPassword(email: email, password: password);
      Navigator.pushNamedAndRemoveUntil(context, '/profile', (route) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Mysnackbar.showmysnack(
            context: context,
            text: 'make sure your password is not typical !',
            color: ColorConst.purple);
      } else if (e.code == 'email-already-in-use') {
        Mysnackbar.showmysnack(
            context: context,
            text: 'this email is already in use !',
            color: ColorConst.purple);
      }
    } catch (e) {
      debugPrint('ERROR ACCURED HERE :|| $e');
    }
  }
}
