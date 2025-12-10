import 'package:flutter/material.dart';
import 'package:quiz_app/screens/login_screen.dart';
import 'package:quiz_app/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      theme: ThemeData(
        fontFamily: 'Risque',
        primaryColor: Color(appPrimaryColor),
        colorScheme: ColorScheme.fromSeed(seedColor: Color(appPrimaryColor)),
      ),
    );
  }
}

const int appPrimaryColor = 0xff7B68EE;
