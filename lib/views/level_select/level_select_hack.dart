import 'package:ez_hax/models/levels.dart';
import 'package:ez_hax/services/database.dart';
import 'package:ez_hax/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:ez_hax/shared/constants.dart';
import 'package:ez_hax/clicky_button/level_select_button.dart';
import 'package:button3d/button3d.dart';
import 'package:provider/provider.dart';
import 'package:ez_hax/models/user.dart';
import '../home.dart';
import 'level_select_template.dart';

class LevelSelectHack extends StatefulWidget {
  @override
  _LevelSelectHackState createState() => _LevelSelectHackState();
}

class _LevelSelectHackState extends State<LevelSelectHack> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final Color colorBottom = Colors.green[700];
    final Color colorTop = Colors.green;

    return StreamBuilder<LevelData>(
        stream: DatabaseService(uid: user.uid).debugData,
    builder: (context, snapshot) {
    if (snapshot.hasData) {
    LevelData levelData = snapshot.data;
    // print('hack data: level 1: ' + levelData.isUnlocked('1').toString());
    // print('hack data: level 2: ' + levelData.isUnlocked('2').toString());
    // print('hack data: level 2222: ' + levelData.isUnlocked('2222').toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'HACK',
          style: TextStyle(
              color: Colors.green, fontSize: 40, fontFamily: 'code_font'),
        ),
      ),
      body: Container(
        height: double.infinity,
        decoration: bgDec,
        child: LevelSelectTemplate(category: 'hack', levelData: levelData),
        /*
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LevelSelectButton(
                  level: 1,
                  isUnlocked: true,
                ),
                LevelSelectButton(
                  level: 2,
                  isUnlocked: false,
                ),
                LevelSelectButton(
                  level: 3,
                  isUnlocked: false,
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
                  isUnlocked: false,
                ),
                LevelSelectButton(
                  level: 5,
                  isUnlocked: false,
                ),
                LevelSelectButton(
                  level: 6,
                  isUnlocked: false,
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
                  isUnlocked: false,
                ),
                LevelSelectButton(
                  level: 8,
                  isUnlocked: false,
                ),
                LevelSelectButton(
                  level: 9,
                  isUnlocked: false,
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
                  isUnlocked: false,
                ),
                LevelSelectButton(
                  level: 11,
                  isUnlocked: false,
                ),
                LevelSelectButton(
                  level: 12,
                  isUnlocked: false,
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
                  isUnlocked: false,
                ),
                LevelSelectButton(
                  level: 14,
                  isUnlocked: false,
                ),
                LevelSelectButton(
                  level: 15,
                  isUnlocked: false,
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
                      topColor: Colors.lightBlue,
                      backColor: Colors.blue[700],
                      borderRadius: BorderRadius.zero,
                    ),
                    onPressed: () {},
                    child: IconButton(
                      icon: Icon(Icons.arrow_left),
                      iconSize: 65,
                      onPressed: () {},
                    ),),
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
                      topColor: Colors.lightBlue,
                      backColor: Colors.blue[700],
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
