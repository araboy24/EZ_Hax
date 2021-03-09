import 'package:flutter/material.dart';

class QuestionForLevel extends StatefulWidget {
  final String question;

  const QuestionForLevel({this.question});

  @override
  _QuestionForLevelState createState() => _QuestionForLevelState();
}

class _QuestionForLevelState extends State<QuestionForLevel> {
  @override
  Widget build(BuildContext context) {

    return Container(
      //margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.blueGrey,
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              widget.question,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
