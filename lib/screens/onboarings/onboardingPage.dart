import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taska/core/constants/PM_const.dart';
import 'package:taska/core/constants/colorConst.dart';
import 'package:taska/core/constants/fontSizeconst.dart';
import 'package:taska/core/constants/radiusConst.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 8), () {
      Navigator.pushNamedAndRemoveUntil(context, '/appinfo', (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: PMconst.medium,
            child: Column(
              children: [
                LottieBuilder.asset('assets/icons/logo.json'),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(RadiusConst.medium), bottomRight: Radius.circular(RadiusConst.medium)),
                  child: TextLiquidFill(
                    text: 'TASKA',
                    waveColor: ColorConst.purple.withRed(2),
                    boxBackgroundColor: ColorConst.kPrimaryColor,
                    textStyle: const TextStyle(
                      fontSize: FontSizeconst.extralarge,
                      fontWeight: FontWeight.bold,
                    ),
                    boxHeight: MediaQuery.of(context).size.height * 0.1,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.150,
                    child: LottieBuilder.asset('assets/icons/loading.json'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
