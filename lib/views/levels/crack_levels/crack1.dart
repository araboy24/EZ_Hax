import 'package:ez_hax/services/database.dart';
import 'package:ez_hax/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:ez_hax/shared/constants.dart';
import 'package:provider/provider.dart';
import 'package:ez_hax/models/user.dart';

class Crack1 extends StatefulWidget {
  @override
  _Crack1State createState() => _Crack1State();
}

class _Crack1State extends State<Crack1> {
  String category = 'crack';
  int level = 1;
  Color aColor = Colors.grey[900];
  Color bColor = Colors.grey[900];
  Color cColor = Colors.grey[900];
  Color dColor = Colors.grey[900];

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Crack 1',
          style: TextStyle(
              color: Colors.red, fontSize: 40, fontFamily: 'code_font'),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: bgDec,
        child: Column(
          children: [
            //code for question
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
                  SizedBox(
                    height: 30,
                  ),

                  // Choice 1
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
                        DatabaseService(uid: user.uid).unlockSpecificLevel(category, level+1);

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
                  SizedBox(
                    height: 20,
                  ),
                  // choice 2
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
                  SizedBox(
                    height: 20,
                  ),
                  //choice 3
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
                  SizedBox(
                    height: 15,
                  ),
                  //choice 4
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
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
