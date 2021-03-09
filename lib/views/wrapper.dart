import 'package:ez_hax/models/user.dart';
import 'package:ez_hax/views/authenticate/authenticate.dart';
import 'package:ez_hax/views/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}