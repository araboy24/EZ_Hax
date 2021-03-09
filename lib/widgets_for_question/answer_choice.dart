import 'package:ez_hax/models/answer_feedback_holder.dart';
import 'package:ez_hax/models/user.dart';
import 'package:ez_hax/services/database.dart';
import 'package:ez_hax/views/levels/crack_levels/crack_question.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AnswerChoice extends StatefulWidget {

  String choice;
  String choiceText;
  String correct;
  String category;
  int level;
  AnswerChoice({this.choice, this.choiceText, this.correct, this.category, this.level});


  @override
  _AnswerChoiceState createState() => _AnswerChoiceState();
}

class _AnswerChoiceState extends State<AnswerChoice> {



  Color clickedColor ;//= (widget.choice == widget.correct) ? Colors.green : Colors.red;
  Color color = Colors.grey[900];
  bool isCorrect;
  @override
  Widget build(BuildContext context) {
    // bool isAnswered

    final user = Provider.of<User>(context);
    isCorrect = (widget.choice.toLowerCase() == widget.correct.toLowerCase());
    clickedColor = (widget.choice.toLowerCase() == widget.correct.toLowerCase()) ? Colors.green : Colors.red;
    return Container(

      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.blueGrey,
        ),
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          setState(() {
            color = clickedColor;
            Provider.of<AnswerFeedbackHolder>(context, listen: false).setAnswered(true);
         //   CrackQuestion.setAnswered(CrackQuestion(),true);
            if(isCorrect){
              DatabaseService(uid: user.uid).unlockSpecificLevel(widget.category, widget.level + 1);
              //final changeCorrect =  Provider.of<AnswerFeedbackHolder>(context).setCorrect(true);
              Provider.of<AnswerFeedbackHolder>(context, listen: false).setCorrect(true);
              //changeCorrect;
              // setState(() {
              //   CrackQuestion.setCorrect(CrackQuestion(),true);
              // });

            } else {
              setState(() {
               // Provider.of<AnswerFeedbackHolder>(context, listen: false).setCorrect(false);
                // CrackQuestion.setCorrect(CrackQuestion(),false);
              });


            }
          });
        },
        child: Container(
          width: 350,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  widget.choice,
                  style: TextStyle(
                    fontFamily: 'code_font',
                    fontSize: 35,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 21,
                ),
                Expanded(
                  child: Text(
                    widget.choiceText,
                    style: TextStyle(
                      //fontFamily: 'code_font',
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
