import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_app/screens/quiz_screen.dart';

class TopicsScreen extends StatelessWidget {
  TopicsScreen({super.key, required this.userName});

  String userName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text(
                      'Choose Topic',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    // Spacer(),
                    Container(
                      width: 135,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFE5E7EB),
                        borderRadius: BorderRadius.circular(32),
                      ),

                      child: Row(
                        children: [
                          Icon(Icons.person, size: 32),
                          Expanded(
                            child: Text(
                              userName,
                              style: TextStyle(fontSize: 14),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(width: 8),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 32),

                // passing parameters using constructor

                // instance 1
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const QuizScreen(),
                      ),
                    );
                  },
                  child: TopicCard(
                    title: "Science",
                    description: "test your science knowledge",
                    iconPath: "assets/science_icon.svg",
                    colorHex: 0xFF4CAF50,
                  ),
                ),

                // instance 2
                TopicCard(
                  title: "History",
                  description: "test your history knowledge",
                  iconPath: "assets/history_icon.svg",
                  colorHex: 0xFFFFC107,
                ),

                // instance 3
                TopicCard(
                  title: "Sports",
                  description: "test your sports knowledge",
                  iconPath: "assets/sports_icon.svg",
                  colorHex: 0xFFF44336,
                ),

                // instance 4
                TopicCard(
                  title: "Geography",
                  description: "test your geography knowledge",
                  iconPath: "assets/geography_icon.svg",
                  colorHex: 0xFF2196F3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TopicCard extends StatelessWidget {
  /// Constructor : is a function with the same name as the class
  /// constructor is used to initialize the properties of the class
  ///

  /* 
  Threre are two types of parameters in the constructor:
   1. Positional parameters: are defined without curly braces {} , and type their order only during sending them
   2. Named parameters: are defined with curly braces {}, and type their names during sending them
  */
  TopicCard({
    required this.title,
    required this.description,
    required this.iconPath,
    required this.colorHex,
  });

  // variables
  String title;
  String description;
  String iconPath;
  int colorHex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Color(colorHex),
              borderRadius: BorderRadius.circular(12),
            ),
            child: SvgPicture.asset(iconPath),
          ),

          SizedBox(width: 16),
          Expanded(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  description,
                  style: TextStyle(color: Color(0xFF666666)),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          Icon((Icons.arrow_forward_ios)),
        ],
      ),
    );
  }
}
