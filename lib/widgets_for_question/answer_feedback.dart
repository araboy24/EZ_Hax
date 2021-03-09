import 'package:ez_hax/shared/constants.dart';
import 'package:ez_hax/views/levels/crack_levels/crack_question.dart';
import 'package:flutter/material.dart';

class AnswerFeedback extends StatefulWidget {

  bool isCorrect;
  String category;
  int level;
  AnswerFeedback({this.isCorrect, this.category, this.level});

  @override
  _AnswerFeedbackState createState() => _AnswerFeedbackState();
}

class _AnswerFeedbackState extends State<AnswerFeedback> {
  @override
  Widget build(BuildContext context) {
    String message = widget.isCorrect ? 'Good Job' : 'Oof not quite pal, Try again...';
    return widget.isCorrect == false ? Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.blueGrey,
        ),
      ),
      child: Text(
        message,
        style: TextStyle(
          color: Colors.white,
          fontSize: 17,
         // fontFamily: 'code_font',

        ),
      ),

    ) : Container(
    //  padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.blueGrey,
        ),
      ),
      child: Row(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              //fontFamily: 'code_font',
            ),
          ),
          Container(
              margin: const EdgeInsets.all(8.0),
            child: FlatButton(
              color: Colors.blue,
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => CrackQuestion(category: widget.category, level: widget.level + 1,),
                      ));
                },
                child: Text('Continue ->',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  //fontFamily: 'code_font',
                ),)
            ),
          ),
        ],
      ),
    );
  }
}
