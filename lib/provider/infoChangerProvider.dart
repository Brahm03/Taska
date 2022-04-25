import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class infoChangerProvider extends ChangeNotifier {
  List<String> textInfo = [
    'Organize Your Tasks &\nProjects Easily',
    'Always Connect with\nTeams Anytime Anywhere',
    'Everything You Can Do\nis the App',
    ''
  ];

  String lorem =
      'Lorem ipsum dolor sit amet. Et libero voluptatem quo corrupti voluptatibus et placeat voluptatum est velit assumenda non asperiores dolore. Id provident voluptatum qui dolor sapiente in odit eligendi. Et asperiores architecto qui pariatur dicta et error minus sit sint ullam a error voluptatem? Ex quos cumque ad molestiae 33 perferendis optio et aliquid fugit.';

  List icons = [
    FadeInLeft(child: LottieBuilder.asset('assets/icons/calendar.json')),
    FadeInRight(child: LottieBuilder.asset('assets/icons/message.json')),
    FadeInLeft(child: LottieBuilder.asset('assets/icons/chart.json')),
    FadeInRight(child: LottieBuilder.asset('assets/icons/chart.json')),
  ];

  int index = 0;

  onTap(BuildContext context) {
    index++;
    notifyListeners();
    if (index == 3) {
      Navigator.pushNamedAndRemoveUntil(context, '/register', (route) => false);
    }
  }
}
