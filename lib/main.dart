import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taska/core/components/app_theme.dart';
import 'package:taska/provider/checkBoxprovider.dart';
import 'package:taska/provider/editProfileImage.dart';
import 'package:taska/provider/hidePasswordProvider.dart';
import 'package:taska/provider/infoChangerProvider.dart';
import 'package:taska/provider/signINprovider.dart';
import 'package:taska/provider/signUPprovider.dart';
import 'package:taska/provider/writeUserInfoProvider.dart';
import 'package:taska/routes/myRoutes.dart';
import 'package:taska/service/FirebaseService.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => infoChangerProvider()),
      ChangeNotifierProvider(create: (_) => CheckBoxprovider()),
      ChangeNotifierProvider(create: (_) => SignUpProvider()),
      ChangeNotifierProvider(create: (_) => HidePasswordProvider()),
      ChangeNotifierProvider(create: (_) => SignINprovider()),
      ChangeNotifierProvider(create: (_) => EditProfileImage()),
      ChangeNotifierProvider(create: (_) => UserInfoProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _myRoute = MyRoutes();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Taska',
      theme: Apptheme.light,
      onGenerateRoute: _myRoute.onGenerateRoute,
      initialRoute:  FirebaseService.auth.currentUser != null ? '/main' : '/splash',
    );
  }
}
