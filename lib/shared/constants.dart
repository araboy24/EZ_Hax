import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  fillColor: Colors.blueGrey,
  filled: true,
  hintStyle: TextStyle(color: Colors.black87),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlue, width: 2),
  ),
);

const bgDec = BoxDecoration(
  image: DecorationImage(
    image: AssetImage('assets/blue_black_bg.jpg'),
    fit: BoxFit.cover,
  ),
);