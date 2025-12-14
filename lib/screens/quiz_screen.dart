import 'package:flutter/material.dart';
import 'package:quiz_app/screens/score_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(22),

          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text('Mohamed'),
                  ),
                  Container(
                    padding: EdgeInsets.all(6),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text('1/10'),
                  ),
                ],
              ),

              SizedBox(height: 55),

              Container(
                padding: EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    LinearProgressIndicator(
                      value: 0.1,
                      color: Colors.purple,
                      backgroundColor: Colors.grey[300],
                      minHeight: 8,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 34),
                      child: Text(
                        'What is the capital of France?',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),

                    SizedBox(height: 25),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const ScoreScreen(),
                        ),
                      ),
                      child: AnswerCard(),
                    ),
                    AnswerCard(),
                    AnswerCard(),
                    AnswerCard(),
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

class AnswerCard extends StatelessWidget {
  const AnswerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text('Berlin'),
    );
  }
}
