import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_app/screens/splash_screen.dart';
import 'package:quiz_app/screens/topics_screen.dart';
import 'package:quiz_app/widgets/app_button.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(22),

          child: Column(
            children: [
              SizedBox(height: 55),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Color(0xFF2ECC71),
                        shape: BoxShape.circle,
                      ),

                      child: SvgPicture.asset(
                        'assets/cup_icon.svg',
                        fit: BoxFit.scaleDown,
                      ),
                    ),

                    SizedBox(height: 24),
                    Text('Quiz Complete!', style: TextStyle(fontSize: 30)),
                    Text('Not bad, keep practicing!'),
                    SizedBox(height: 32),

                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 24),
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          colors: [Color(0xFF8A2BE2), Color(0xFF4169E1)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),

                      child: Column(
                        children: [
                          Text(
                            'Your Score',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            '4/10',
                            style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Excellent!',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 32),
                    AppButton(
                      text: 'Play Again',
                      onPressHandler: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                TopicsScreen(userName: ''),
                          ),
                          (route) => false,
                        );
                      },
                      icon: Icons.replay,
                      backgroundColor: 0xFF8A2BE2,
                      contentColor: 0xFFFFFFFF,
                    ),
                    SizedBox(height: 12),
                    AppButton(
                      text: 'Exit & Logout',
                      onPressHandler: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => SplashScreen(),
                          ),
                          (route) => false,
                        );
                      },
                      icon: Icons.exit_to_app,
                      backgroundColor: 0xFFE0E0E0,
                      contentColor: 0xFF333333,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
