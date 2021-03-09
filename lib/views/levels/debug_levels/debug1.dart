import 'package:ez_hax/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:ez_hax/shared/constants.dart';

class Debug1 extends StatefulWidget {
  @override
  _Debug1State createState() => _Debug1State();
}

class _Debug1State extends State<Debug1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'DEBUG 1',
            style: TextStyle(
                color: Colors.lightBlue, fontSize: 40, fontFamily: 'code_font'),
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
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.blueGrey,
                      width: 2,
                    )),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 20, 20, 0),
                      child: Text(
                        'for (int i = 0; i < 5; i++) {',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: Text(
                        'System.out.print(i); }',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
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
                            padding: const EdgeInsets.fromLTRB(20.0, 20, 20, 0),
                            child: Text(
                              'The expected output is:',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: Text(
                              '12345',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                            child: Text(
                              'How can this be fixed?',
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
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.blueGrey,
                          )),
                      child: GestureDetector(
                        onTap: () {},
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
                                'Change i++ to ++i',
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
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.blueGrey,
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {},
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
                                'Change i<5 to i<=5',
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
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.blueGrey,),
                      ),
                      child: GestureDetector(
                        onTap: () {},
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
                                'Change print(i) to print(i++)',
                                style: TextStyle(
                                  //fontFamily: 'code_font',
                                  fontSize: 17,
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
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.blueGrey),),
                      child: GestureDetector(
                        onTap: () {},
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
                                'Change print(i) to print(i+1)',
                                style: TextStyle(
                                  //fontFamily: 'code_font',
                                  fontSize: 17,
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
        ));
  }
}
