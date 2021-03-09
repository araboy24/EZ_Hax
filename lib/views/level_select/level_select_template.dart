import 'package:ez_hax/clicky_button/level_select_button.dart';
import 'package:ez_hax/models/levels.dart';
import 'package:flutter/material.dart';
import 'package:ez_hax/clicky_button/clicky_button.dart';
import 'package:button3d/button3d.dart';

class LevelSelectTemplate extends StatefulWidget {
  final String category;
  final LevelData levelData;

  const LevelSelectTemplate({this.category, this.levelData});
  @override
  _LevelSelectTemplateState createState() => _LevelSelectTemplateState();
}

class _LevelSelectTemplateState extends State<LevelSelectTemplate> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LevelSelectButton(
                level: 1,
                isUnlocked: widget.levelData.isUnlocked('1'),
                category: widget.category,
              ),
              LevelSelectButton(
                level: 2,
                isUnlocked: widget.levelData.isUnlocked('2'),
                category: widget.category,
              ),
              LevelSelectButton(
                level: 3,
                isUnlocked: widget.levelData.isUnlocked('3'),
                category: widget.category,
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
                isUnlocked: widget.levelData.isUnlocked('4'),
                category: widget.category,
              ),
              LevelSelectButton(
                level: 5,
                isUnlocked: widget.levelData.isUnlocked('5'),
                category: widget.category,
              ),
              LevelSelectButton(
                level: 6,
                isUnlocked: widget.levelData.isUnlocked('6'),
                category: widget.category,
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
                isUnlocked: widget.levelData.isUnlocked('7'),
                category: widget.category,
              ),
              LevelSelectButton(
                level: 8,
                isUnlocked: widget.levelData.isUnlocked('8'),
                category: widget.category,
              ),
              LevelSelectButton(
                level: 9,
                isUnlocked: widget.levelData.isUnlocked('9'),
                category: widget.category,
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
                isUnlocked: widget.levelData.isUnlocked('10'),
                category: widget.category,
              ),
              LevelSelectButton(
                level: 11,
                isUnlocked: widget.levelData.isUnlocked('11'),
                category: widget.category,
              ),
              LevelSelectButton(
                level: 12,
                isUnlocked: widget.levelData.isUnlocked('12'),
                category: widget.category,
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
                isUnlocked: widget.levelData.isUnlocked('13'),
                category: widget.category,
              ),
              LevelSelectButton(
                level: 14,
                isUnlocked: widget.levelData.isUnlocked('14'),
                category: widget.category,
              ),
              LevelSelectButton(
                level: 15,
                isUnlocked: widget.levelData.isUnlocked('15'),
                category: widget.category,
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
                  topColor: Colors.grey,
                  backColor: Colors.grey[700],
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
                  topColor: Colors.white,
                  backColor: Colors.blueGrey[800],
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
                    topColor: Colors.grey,
                    backColor: Colors.grey[700],
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
    );
  }
}
