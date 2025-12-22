import 'package:flutter/material.dart';
import 'package:quiz_app/screens/score_screen.dart';

class QuizScreen extends StatefulWidget {
  QuizScreen({
    super.key,
    required this.title,
    required this.description,
    required this.iconPath,
    required this.colorHex,
    required this.questions,
  });

  String title;
  String description;
  String iconPath;
  int colorHex;
  List questions;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;
  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    var size = MediaQuery.of(context).size;

    String view = currentView(size.width);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(widget.colorHex),
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
                    child: Text(widget.title),
                  ),
                  Container(
                    padding: EdgeInsets.all(6),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${currentQuestionIndex + 1}/${widget.questions.length}',
                    ),
                  ),
                ],
              ),

              SizedBox(height: orientation == Orientation.landscape ? 12 : 55),
              Switch.adaptive(value: true, onChanged: (value) {}),
              IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () {
                  showAdaptiveDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog.adaptive(
                        title: Text('Exit Quiz'),
                        content: Text(
                          'Are you sure you want to exit the quiz? Your progress will be lost.',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                              Navigator.of(
                                context,
                              ).pop(); // Exit the quiz screen
                            },
                            child: Text('Exit'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              SizedBox(height: orientation == Orientation.landscape ? 12 : 55),

              Container(
                padding: EdgeInsets.all(
                  orientation == Orientation.landscape ? 12 : 22,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LinearProgressIndicator(
                      value:
                          (currentQuestionIndex + 1) / widget.questions.length,
                      color: Color(widget.colorHex),
                      backgroundColor: Colors.grey[300],
                      minHeight: 8,
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                        top: orientation == Orientation.landscape ? 12 : 34,
                      ),
                      child: Text(
                        widget.questions[currentQuestionIndex]['questionText'],
                        style: TextStyle(fontSize: 24),
                      ),
                    ),

                    SizedBox(height: 25),

                    GridView(
                      scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: view == "mobile" ? 1 : 2,
                        mainAxisSpacing: 12,
                        childAspectRatio: view == "mobile" ? 6 : 1,
                        crossAxisSpacing: 8,
                      ),
                      shrinkWrap: true,
                      physics: AlwaysScrollableScrollPhysics(),
                      children: [
                        for (
                          int i = 0;
                          i <
                              (widget.questions[currentQuestionIndex]['answers']
                                      as List)
                                  .length;
                          i++
                        )
                          InkWell(
                            onTap: () {
                              score +=
                                  widget.questions[currentQuestionIndex]['answers'][i]['score']
                                      as int;
                              if (currentQuestionIndex <
                                  widget.questions.length - 1) {
                                setState(() {
                                  currentQuestionIndex++;
                                });
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        ScoreScreen(
                                          score: score,
                                          totalQuestions:
                                              widget.questions.length,
                                        ),
                                  ),
                                );
                              }
                            },
                            child: AnswerCard(
                              answer: widget
                                  .questions[currentQuestionIndex]['answers'][i],
                            ),
                          ),
                      ],
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

class AnswerCard extends StatelessWidget {
  final Map answer;
  const AnswerCard({super.key, required this.answer});

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
      child: Text(answer['answerText']),
    );
  }
}

String currentView(num maxWidth) {
  if (maxWidth < 600) {
    return 'mobile';
  } else if (maxWidth < 1024) {
    return 'tablet';
  } else {
    return 'desktop';
  }
}
