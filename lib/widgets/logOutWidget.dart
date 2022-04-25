
import 'package:flutter/material.dart';
import 'package:taska/core/constants/PM_const.dart';
import 'package:taska/core/constants/colorConst.dart';
import 'package:taska/core/constants/fontSizeconst.dart';
import 'package:taska/core/constants/radiusConst.dart';
import 'package:taska/service/FirebaseService.dart';
import 'package:taska/widgets/mybutton.dart';

class LogOutWidget extends StatelessWidget {
  const LogOutWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: PMconst.medium,
      height: size.height * 0.3,
      margin: PMconst.medium,
      decoration: BoxDecoration(
          color: ColorConst.white,
          borderRadius: BorderRadius.circular(
              RadiusConst.medium)),
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.spaceAround,
        children: [
          const Text(
            'Log out',
            style: TextStyle(
                fontFamily: 'myfont',
                fontWeight: FontWeight.bold,
                fontSize: FontSizeconst.medium,
                color: ColorConst.red),
          ),
          Divider(
            indent: size.width * 0.1,
            endIndent: size.width * 0.1,
            color: ColorConst.darkgrey,
            thickness: 0.5,
          ),
          const Text(
            'Are you sure you want to log out?',
            style: TextStyle(
              fontFamily: 'myfont',
              fontWeight: FontWeight.bold,
              fontSize: FontSizeconst.medium,
            ),
          ),
          Mybutton(
              onPressed: () {
                FirebaseService.auth.signOut();
                Navigator
                    .pushNamedAndRemoveUntil(
                        context,
                        '/signup',
                        (route) => false);
              },
              textcolor: ColorConst.blue,
              buttonColor:
                  ColorConst.kPrimaryColor,
              text: 'Yes, log out'),
          Mybutton(
              onPressed: () {
                Navigator.pop(context);
              },
              textcolor:
                  ColorConst.kPrimaryColor,
              buttonColor: ColorConst.blue,
              text: 'Cancel')
        ],
      ),
    );
  }
}
