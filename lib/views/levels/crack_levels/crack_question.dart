import 'package:ez_hax/models/answer_feedback_holder.dart';
import 'package:ez_hax/models/question.dart';
import 'package:ez_hax/services/database.dart';
import 'package:ez_hax/shared/constants.dart';
import 'package:ez_hax/shared/loading.dart';
import 'package:ez_hax/views/home.dart';
import 'package:ez_hax/widgets_for_question/answer_choice.dart';
import 'package:ez_hax/widgets_for_question/answer_feedback.dart';
import 'package:ez_hax/widgets_for_question/answer_feedback_wrapper.dart';
import 'package:ez_hax/widgets_for_question/code_block.dart';
import 'package:ez_hax/widgets_for_question/question_for_level.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ez_hax/models/user.dart';

class CrackQuestion extends StatefulWidget {
  String category;
  int level;
  QuestionData questionDataTop;
 // bool isAnswered = false;
  //bool isCorrect = false;

  CrackQuestion({this.category, this.level});

  // static void setAnswered(CrackQuestion cq, bool b) {
  //   cq.isAnswered = b;
  // }
  //
  // static void setCorrect(CrackQuestion cq, bool b) {
  //   cq.isCorrect = b;
  // }

  @override
  _CrackQuestionState createState() => _CrackQuestionState();
}

class _CrackQuestionState extends State<CrackQuestion> {
  Color aColor = Colors.grey[900];
  Color bColor = Colors.grey[900];
  Color cColor = Colors.grey[900];
  Color dColor = Colors.grey[900];

  Color categoryColor;

  // static void setAnswered(CrackQuestion cq, bool b){
  //   cq.isAnswered = b;
  // }

  // static void setCorrect(CrackQuestion cq, bool b){
  //   cq.isCorrect = b;
  // }

  @override
  Widget build(BuildContext context) {
    if (widget.category.toLowerCase() == 'debug') {
      categoryColor = Colors.blue;
    } else if (widget.category.toLowerCase() == 'hack') {
      categoryColor = Colors.green;
    } else {
      categoryColor = Colors.red;
    }

    // bool isCorrect = false;
    // bool isAnswered = false;
    // Provider.of<AnswerFeedbackHolder>(context, listen: false).setAnswered(false);
    // Provider.of<AnswerFeedbackHolder>(context, listen: false).setCorrect(false);

    final user = Provider.of<User>(context);
    final feedback = Provider.of<AnswerFeedbackHolder>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
        create: (context) => AnswerFeedbackHolder(false, false),
        ),
      ],
      child:


 //   feedback.setCorrect(false);
   // feedback.setAnswered(false);
       // return
        StreamBuilder<QuestionData>(
          stream: DatabaseService(uid: user.uid)
              .loadQuestionFromFirebase(widget.category, widget.level),
          builder: (context, snapshot) {
            if (snapshot.hasData) {

              QuestionData questionData = snapshot.data;
              widget.questionDataTop = questionData;
              // print('question: ' + questionData.question);
              // print('code: ' + widget.questionDataTop.code);
              // print('a: ' + questionData.a);
              // print('b: ' + questionData.b);
              // print('c: ' + questionData.c);
              // print('d: ' + questionData.d);
              // print('correct: ' + questionData.correctChoice);

              bool isCorrectFromProvider = Provider.of<AnswerFeedbackHolder>(context).isCorrect;
              bool isAnsweredFromProvider = Provider.of<AnswerFeedbackHolder>(context).isAnswered;


              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.black,
                  title: Text(
                    widget.category.toUpperCase() + ' ' + widget.level.toString(),
                    style: TextStyle(
                        color: categoryColor,
                        fontSize: 30,
                        fontFamily: 'code_font'),
                  ),
                  actions: [
                    FlatButton.icon(
                        textColor: categoryColor,
                        onPressed: () {
                          //Navigator.popUntil(context, ModalRoute.withName('/home'));
                          Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
                          // Navigator.pushReplacement(
                          //     context,
                          //     ModalRoute.withName('/home')
                          //     // MaterialPageRoute(
                          //     //   builder: (BuildContext context) => Home(),
                          //     // ),
                          // );
                          // Navigator.pushAndRemoveUntil(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (BuildContext context) => Home(),
                          //   ),
                          //   (route) => false,
                          // );
                        },
                        icon: Icon(
                          Icons.home,
                          size: 35,
                        ),
                        label: Text('')),
                  ],
                ),
                body: Container(
                  height: double.infinity,
                  width: MediaQuery.of(context).size.width,
                  decoration: bgDec,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        //code for question
                        CodeBlock(code: widget.questionDataTop.code),
                        /* old hard coded style
                        Container(
                          margin: EdgeInsets.all(10),
                          //width: 200,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.blueGrey,
                                width: 2,
                              )),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20.0, 20, 20, 0),
                                // String question = "";
                                child: Text(
                                  'public static void main(String[] args){',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: Text(
                                  ' Integer num1 = 100;',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: Text(
                                  ' Integer num1 = 100;',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: Text(
                                  ' if(num1==num2){',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: Text(
                                  ' System.out.println("num1 == num2");',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: Text(
                                  '} else {',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                                child: Text(
                                  'System.out.println("num1 != num2"); }}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        */
                        SizedBox(height: 30),

                        // Question and choices
                        Container(
                          margin: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.blueGrey,
                              width: 3,
                            ),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),

                              // The question
                              QuestionForLevel(
                                question: questionData.question,
                              ),
                              /*
                              Container(
                                //margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.black38,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.blueGrey,
                                      width: 2,
                                    )),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Text(
                                        'What happens upon running?',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              */
                              SizedBox(
                                height: 15,
                              ),

                              AnswerFeedbackWrapper(
                                isCorrect:isCorrectFromProvider,
                                category: widget.category,
                                level: widget.level,
                                answered: isAnsweredFromProvider,
                              ),
                              // if(isCorrect == null){
                              //   return SizedBox(height: 0,),
                              // }

                              SizedBox(
                                height: 15,
                              ),

                              // Choice 1
                              GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: (){
                                  setState(() {
                                    // isAnswered = true;
                                    // if('a' == questionData.correctChoice.toLowerCase()){
                                    //   isCorrect = true;
                                    // } else {
                                    //   isCorrect = false;
                                    // }
                                  });
                                },
                                child: AnswerChoice(
                                  choiceText: questionData.a,
                                  choice: 'A',
                                  correct: questionData.correctChoice,
                                  category: widget.category,
                                  level: widget.level,
                                ),
                              ),
                              /*
                              Container(
                                margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                decoration: BoxDecoration(
                                    color: aColor,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.blueGrey,
                                    )),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      aColor = Colors.green;
                                    });
                                    DatabaseService(uid: user.uid).unlockSpecificLevel(widget.category, widget.level+1);

                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'A',
                                          style: TextStyle(
                                            fontFamily: 'code_font',
                                            fontSize: 35,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 21,
                                        ),
                                        Text(
                                          'It prints: num1 == num2',
                                          style: TextStyle(
                                            //fontFamily: 'code_font',
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                               */

                              SizedBox(
                                height: 20,
                              ),
                              // choice 2
                              AnswerChoice(
                                choice: 'B',
                                correct: questionData.correctChoice,
                                choiceText: questionData.b,
                                category: widget.category,
                                level: widget.level,
                              ),
                              /*
                              Container(
                                margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                decoration: BoxDecoration(
                                  color: bColor,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      bColor = Colors.red;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'B',
                                          style: TextStyle(
                                            fontFamily: 'code_font',
                                            fontSize: 35,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 21,
                                        ),
                                        Text(
                                          'It prints: num1 != num2',
                                          style: TextStyle(
                                            //fontFamily: 'code_font',
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              */
                              SizedBox(
                                height: 20,
                              ),
                              //choice 3
                              AnswerChoice(
                                choiceText: questionData.c,
                                choice: 'C',
                                correct: questionData.correctChoice,
                                category: widget.category,
                                level: widget.level,
                              ),
                              /*
                              Container(
                                margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                decoration: BoxDecoration(
                                  color: cColor,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      cColor = Colors.red;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'C',
                                          style: TextStyle(
                                            fontFamily: 'code_font',
                                            fontSize: 35,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 21,
                                        ),
                                        Text(
                                          'It prints nothing',
                                          style: TextStyle(
                                            //fontFamily: 'code_font',
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              */
                              SizedBox(
                                height: 15,
                              ),
                              //choice 4
                              AnswerChoice(
                                choiceText: questionData.d,
                                choice: 'D',
                                correct: questionData.correctChoice,
                                category: widget.category,
                                level: widget.level,
                              ),
                              /*
                              Container(
                                margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                decoration: BoxDecoration(
                                  color: dColor,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.blueGrey),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      dColor = Colors.red;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'D',
                                          style: TextStyle(
                                            fontFamily: 'code_font',
                                            fontSize: 35,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 21,
                                        ),
                                        Text(
                                          'An error occurs',
                                          style: TextStyle(
                                            //fontFamily: 'code_font',
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              */
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              print('Snapshot Had no data....');
              print(snapshot.data);
              return Loading();
            }
          }//),
        ),
    );
  }
}
