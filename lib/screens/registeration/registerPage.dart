import 'package:flutter/material.dart';
import 'package:taska/core/constants/IconConst.dart';
import 'package:taska/core/constants/colorConst.dart';
import 'package:taska/core/constants/fontSizeconst.dart';
import 'package:taska/widgets/connectWith.dart';
import 'package:taska/widgets/mybutton.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            top: size.height * 0.2,
            left: size.width * 0.1,
            right: size.width * 0.1),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const Text(
            'Let\' you in',
            style: TextStyle(
                fontFamily: 'myfont',
                fontWeight: FontWeight.bold,
                fontSize: FontSizeconst.large),
          ),
          SizedBox(
            height: size.height * 0.150,
          ),
          ConnectWIth(
            ontap: () {},
            icon: IconConst.facebook,
            width: size.width * 0.9,
            text: const Text(
              'Connect with Facebook',
              style: TextStyle(
                  fontFamily: 'myfont', fontSize: FontSizeconst.medium),
            ),
          ),
          SizedBox(
            height: size.height * 0.020,
          ),
          ConnectWIth(
              ontap: () {},
              icon: IconConst.apple,
              width: size.width * 0.9,
              text: const Text(
                'Connect with Apple',
                style: TextStyle(
                    fontFamily: 'myfont', fontSize: FontSizeconst.medium),
              )),
          SizedBox(
            height: size.height * 0.020,
          ),
          ConnectWIth(
              ontap: () {},
              icon: IconConst.google,
              width: size.width * 0.9,
              text: const Text(
                'Connect with Google',
                style: TextStyle(
                    fontFamily: 'myfont', fontSize: FontSizeconst.medium),
              )),
          SizedBox(
            height: size.height * 0.050,
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.040,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 1,
                      color: ColorConst.darkgrey),
                  const Text(
                    'or',
                    style: TextStyle(
                        fontFamily: 'myfont',
                        fontWeight: FontWeight.w300,
                        fontSize: FontSizeconst.medium),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 1,
                      color: ColorConst.darkgrey),
                ],
              )),
          SizedBox(
            height: size.height * 0.050,
          ),
          Mybutton(
              onPressed: () {},
              textcolor: ColorConst.blue,
              buttonColor: ColorConst.kPrimaryColor,
              text: 'Sign in with password'),
          SizedBox(
            height: size.height * 0.030,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Don\'t have an account?',
                style:
                    TextStyle(fontFamily: 'myfont', color: ColorConst.darkgrey),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/signup', (route) => false);
                  },
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                        fontFamily: 'myfont',
                        fontWeight: FontWeight.bold,
                        color: ColorConst.kPrimaryColor),
                  ))
            ],
          ),
        ]),
      ),
    );
  }
}
