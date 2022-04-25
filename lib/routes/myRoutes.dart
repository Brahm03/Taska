import 'package:flutter/material.dart';
import 'package:taska/screens/home/mainPage.dart';
import 'package:taska/screens/onboarings/onboardingPage.dart';
import 'package:taska/screens/onboarings/splash1.dart';
import 'package:taska/screens/registeration/creatingProfile.dart';
import 'package:taska/screens/registeration/registerPage.dart';
import 'package:taska/screens/registeration/signUppage.dart';
import 'package:taska/screens/search/searchPage.dart';

class MyRoutes {
  Route? onGenerateRoute(RouteSettings s) {
    var args = s.arguments;

    switch (s.name) {
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignupPage());
      case '/register':
        return MaterialPageRoute(builder: (_) => RegisterPage());  
      case '/splash':
        return MaterialPageRoute(builder: (_) => const OnBoardingPage());
      case '/appinfo':
        return MaterialPageRoute(builder: (_) => const SplashOne());
      case '/profile':
        return MaterialPageRoute(builder: (_) => CreatingProfilePage());
      case '/main':
        return MaterialPageRoute(builder: (_) => const MainPage());
      case '/search':
        return MaterialPageRoute(builder: (_) => SearchPage());  
    }
  }
}
