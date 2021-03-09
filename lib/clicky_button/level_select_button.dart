import 'package:ez_hax/views/levels/crack_levels/crack1.dart';
import 'package:ez_hax/views/levels/crack_levels/crack_question.dart';
import 'package:ez_hax/views/levels/debug_levels/debug1.dart';
import 'package:flutter/material.dart';
import 'package:button3d/button3d.dart';

class LevelSelectButton extends StatelessWidget {
  final int level;
  final bool isUnlocked;
  final String category;

  const LevelSelectButton({this.level, this.isUnlocked, this.category});

  Widget _lsb(context, int level, bool isUnlocked, String category) {
    Color colorBottom;
    Color colorTop;
    if(category == 'debug'){
      colorBottom = Colors.blue[700];
      colorTop = Colors.blue;
    } else if (category == 'hack'){
      colorBottom = Colors.green[700];
      colorTop = Colors.green;
    } else {
      colorBottom = Colors.red[700];
      colorTop = Colors.red;
    }

    if (isUnlocked) {
      return Button3d(
        style: Button3dStyle(
          topColor: colorTop,
          backColor: colorBottom,
          borderRadius: BorderRadius.zero,
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                //TODO This is for testing purposes must be changed later
                builder: (BuildContext context) => CrackQuestion(category: category, level: level),
              ));
        },
        child: Text(
          level.toString(),
          style: TextStyle(
            fontFamily: 'code_font',
            fontSize: 35,
            color: Colors.black,
          ),
        ),
      );
    } else {
      return Button3d(
          style: Button3dStyle(
            topColor: Colors.blueGrey,
            backColor: Colors.blueGrey[700],
            borderRadius: BorderRadius.zero,
          ),
          onPressed: () {},
          child: IconButton(
            icon: Icon(Icons.lock),
            color: Colors.black,
            focusColor: Colors.black,
            splashColor: Colors.black,
            iconSize: 35,
            onPressed: () {},
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return _lsb(context, this.level, this.isUnlocked, this.category);
  }
}
