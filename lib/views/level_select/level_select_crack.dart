import 'package:ez_hax/models/levels.dart';
import 'package:ez_hax/models/user.dart';
import 'package:ez_hax/services/database.dart';
import 'package:ez_hax/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:ez_hax/shared/constants.dart';
import 'package:ez_hax/clicky_button/level_select_button.dart';
import 'package:button3d/button3d.dart';
import 'package:provider/provider.dart';

import '../home.dart';
import 'level_select_template.dart';

class LevelSelectCrack extends StatefulWidget {
  @override
  _LevelSelectCrackState createState() => _LevelSelectCrackState();
}

class _LevelSelectCrackState extends State<LevelSelectCrack> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final Color colorBottom = Colors.red[700];
    final Color colorTop = Colors.red;

    return StreamBuilder<LevelData>(
        stream: DatabaseService(uid: user.uid).crackData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            LevelData levelData = snapshot.data;
            print('crack data: level 1: ' + levelData.isUnlocked('1').toString());
            print('crack data: level 2: ' + levelData.isUnlocked('2').toString());
            print('crack data: level 2222: ' + levelData.isUnlocked('2222').toString());
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.black,
                title: Text(
                  'CRACK',
                  style: TextStyle(
                      color: Colors.red, fontSize: 40, fontFamily: 'code_font'),
                ),
              ),
              body: Container(
                height: double.infinity,
                decoration: bgDec,
                child: LevelSelectTemplate(category: 'crack', levelData: levelData),
                /*
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        LevelSelectButton(
                          level: 1,
                          isUnlocked: levelData.isUnlocked('1'),
                          colorBottom: colorBottom,
                          colorTop: colorTop,
                        ),
                        LevelSelectButton(
                          level: 2,
                          isUnlocked: levelData.isUnlocked('2'),
                          colorBottom: colorBottom,
                          colorTop: colorTop,
                        ),
                        LevelSelectButton(
                          level: 3,
                          isUnlocked: levelData.isUnlocked('3'),
                          colorBottom: colorBottom,
                          colorTop: colorTop,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        LevelSelectButton(
                          level: 4,
                          isUnlocked: levelData.isUnlocked('4'),
                          colorBottom: colorBottom,
                          colorTop: colorTop,
                        ),
                        LevelSelectButton(
                          level: 5,
                          isUnlocked: levelData.isUnlocked('5'),
                          colorBottom: colorBottom,
                          colorTop: colorTop,
                        ),
                        LevelSelectButton(
                          level: 6,
                          isUnlocked: levelData.isUnlocked('6'),
                          colorBottom: colorBottom,
                          colorTop: colorTop,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        LevelSelectButton(
                          level: 7,
                          isUnlocked: levelData.isUnlocked('7'),
                          colorBottom: colorBottom,
                          colorTop: colorTop,
                        ),
                        LevelSelectButton(
                          level: 8,
                          isUnlocked: levelData.isUnlocked('8'),
                          colorBottom: colorBottom,
                          colorTop: colorTop,
                        ),
                        LevelSelectButton(
                          level: 9,
                          isUnlocked: levelData.isUnlocked('9'),
                          colorBottom: colorBottom,
                          colorTop: colorTop,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        LevelSelectButton(
                          level: 10,
                          isUnlocked: levelData.isUnlocked('10'),
                          colorBottom: colorBottom,
                          colorTop: colorTop,
                        ),
                        LevelSelectButton(
                          level: 11,
                          isUnlocked: levelData.isUnlocked('11'),
                          colorBottom: colorBottom,
                          colorTop: colorTop,
                        ),
                        LevelSelectButton(
                          level: 12,
                          isUnlocked: levelData.isUnlocked('12'),
                          colorBottom: colorBottom,
                          colorTop: colorTop,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        LevelSelectButton(
                          level: 13,
                          isUnlocked: levelData.isUnlocked('13'),
                          colorBottom: colorBottom,
                          colorTop: colorTop,
                        ),
                        LevelSelectButton(
                          level: 14,
                          isUnlocked: levelData.isUnlocked('14'),
                          colorBottom: colorBottom,
                          colorTop: colorTop,
                        ),
                        LevelSelectButton(
                          level: 15,
                          isUnlocked: levelData.isUnlocked('15'),
                          colorBottom: colorBottom,
                          colorTop: colorTop,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Button3d(
                          style: Button3dStyle(
                            topColor: Colors.red,
                            backColor: Colors.red[700],
                            borderRadius: BorderRadius.zero,
                          ),
                          onPressed: () {},
                          child: IconButton(
                            icon: Icon(Icons.arrow_left),
                            iconSize: 65,
                            onPressed: () {},
                          ),
                        ),
                        Button3d(
                          style: Button3dStyle(
                            topColor: Colors.green[500],
                            backColor: Colors.green[700],
                            borderRadius: BorderRadius.zero,
                          ),
                          onPressed: () {},
                          child: IconButton(
                            icon: Icon(Icons.home),
                            iconSize: 55,
                            onPressed: () {
                              Navigator.pop(
                                context,
                                // MaterialPageRoute(
                                //   builder: (BuildContext context) => Home(),
                                // ),
                              );
                            },
                          ),
                        ),
                        Button3d(
                            style: Button3dStyle(
                              topColor: Colors.red,
                              backColor: Colors.red[700],
                              borderRadius: BorderRadius.zero,
                            ),
                            onPressed: () {},
                            child: IconButton(
                              icon: Icon(Icons.arrow_right),
                              iconSize: 65,
                              onPressed: () {},
                            )),
                      ],
                    )
                  ],
                ),

                 */
              ),
            );
          } else {
            print('Snapshot Had no data....');
            print(snapshot.data);
            return Loading();
          }
        });
  }
}
