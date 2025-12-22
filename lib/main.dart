import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/screens/splash_screen.dart';

void main() {
  runApp(MyApp());

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    // DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: Color(appPrimaryColor),
        fontFamily: 'Risque',
        primaryColor: Color(appPrimaryColor),
        colorScheme: ColorScheme.fromSeed(seedColor: Color(appPrimaryColor)),
      ),
    );
  }
}

const int appPrimaryColor = 0xff7B68EE;
