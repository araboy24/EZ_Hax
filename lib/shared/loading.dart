import 'package:flutter/material.dart';
import 'package:ez_hax/shared/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'EZ-HAX',
          style: TextStyle(
              color: Colors.lightBlue, fontSize: 40, fontFamily: 'code_font'),
        ),
      ),
      body: Container(
       decoration: bgDec,
        child: Center(
          child: SpinKitCubeGrid(
            color: Colors.blue,
            size: 100.0,
          ),
        ),

      ),

    );
  }
}
