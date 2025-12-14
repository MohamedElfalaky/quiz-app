import 'package:flutter/material.dart';
import 'package:quiz_app/screens/login_screen.dart';
import 'package:quiz_app/screens/quiz_screen.dart';
import 'package:quiz_app/screens/score_screen.dart';
import 'package:quiz_app/screens/splash_screen.dart';
import 'package:quiz_app/screens/topics_screen.dart';

void main() {
  runApp(MyApp());
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
