import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.primaryColor,

      body: Center(
        child: Container(
          padding: EdgeInsets.all(32),
          width: 358,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/user_icon.png'),
              SizedBox(height: 24),
              Text(
                'Welcome!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Text(
                'Enter your name to start playing',
                style: TextStyle(color: Color(0xFF555555), fontSize: 16),
              ),
              SizedBox(height: 32),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Your Name',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),

              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  // contentPadding: EdgeInsets.symmetric(
                  //   horizontal: 16,
                  //   vertical: 12,
                  // ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Start Quiz'),

                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.primaryColor,
                    foregroundColor: Colors.white,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
