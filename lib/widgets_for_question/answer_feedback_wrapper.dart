import 'package:ez_hax/widgets_for_question/answer_feedback.dart';
import 'package:flutter/material.dart';

class AnswerFeedbackWrapper extends StatefulWidget {

  bool isCorrect;
  String category;
  int level;
  bool answered;
  AnswerFeedbackWrapper({this.isCorrect, this.category, this.level, this.answered});

  @override
  _AnswerFeedbackWrapperState createState() => _AnswerFeedbackWrapperState();
}

class _AnswerFeedbackWrapperState extends State<AnswerFeedbackWrapper> {
  @override
  Widget build(BuildContext context) {
    return widget.answered ?
    AnswerFeedback(isCorrect: widget.isCorrect, level: widget.level, category: widget.category,) :
        SizedBox();
  }
}
