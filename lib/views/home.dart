import 'package:ez_hax/models/user.dart';
import 'package:ez_hax/services/auth.dart';
import 'package:ez_hax/services/database.dart';
import 'package:ez_hax/views/authenticate/authenticate.dart';
import 'package:ez_hax/views/authenticate/signin.dart';
import 'package:ez_hax/views/level_select/level_select_debug.dart';
import 'package:ez_hax/views/level_select/level_select_hack.dart';
import 'package:flutter/material.dart';
import 'package:ez_hax/clicky_button/clicky_button.dart';
import 'package:ez_hax/shared/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'level_select/level_select_crack.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'EZ-HAX',
          style: TextStyle(
              color: Colors.lightBlue, fontSize: 40, fontFamily: 'code_font'),
        ),
        actions: [
          FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
                // Navigator.pushAndRemoveUntil(
                //   context,
                //   MaterialPageRoute(
                //     builder: (BuildContext context) => Authenticate(),
                //   ),
                //       (route) => false,
                // );
              },
              icon: Icon(
                Icons.logout,
                color: Colors.blue,
              ),
              label: Text('')),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/blue_black_bg.jpg'),
          fit: BoxFit.cover,
        )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: ClickyButton(
                  child: Text(
                    'HACK',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontFamily: 'code_font'),
                  ),
                  color: Colors.green,
                  onPressed: () {
                    if (user != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                LevelSelectHack(),
                          ));
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: ClickyButton(
                  child: Text(
                    'CRACK',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontFamily: 'code_font'),
                  ),
                  color: Colors.red,
                  onPressed: () {
                    if (user != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                LevelSelectCrack(),
                          ));
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: ClickyButton(
                  child: Text(
                    'DEBUG',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontFamily: 'code_font'),
                  ),
                  color: Colors.lightBlue,
                  onPressed: () {
                    if (user != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                LevelSelectDebug(),
                          ));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if(user != null) {
            DatabaseService(uid: user.uid).unlockAllLevels();
          }
        },
        child: Icon(
          Icons.lock_open_outlined,
          color: Colors.black,
        ),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
