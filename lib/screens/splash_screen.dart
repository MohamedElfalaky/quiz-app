import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.primaryColor,

      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/app_logo.png"),

            SizedBox(height: 27),
            Text(
              "QuizMaster",
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Color(0xffffffff),
              ),
            ),

            SizedBox(height: 21),
            Text(
              'Test your knowledge and have fun!',
              style: TextStyle(fontSize: 18, color: Color(0xffffffff)),
            ),
          ],
        ),
      ),
    );
  }
}
