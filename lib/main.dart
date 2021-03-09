import 'package:ez_hax/models/answer_feedback_holder.dart';
import 'package:ez_hax/models/user.dart';
import 'package:ez_hax/services/auth.dart';
import 'package:ez_hax/shared/loading.dart';
import 'package:ez_hax/views/authenticate/authenticate.dart';
import 'package:ez_hax/views/authenticate/reset_password.dart';
import 'package:ez_hax/views/authenticate/signin.dart';
import 'package:ez_hax/views/authenticate/signup.dart';
import 'package:ez_hax/views/level_select/level_select_hack.dart';
import 'package:ez_hax/views/levels/crack_levels/crack_question.dart';
import 'package:ez_hax/views/wrapper.dart';
import 'package:flutter/material.dart';
import 'views/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AnswerFeedbackHolder(false, false),
        ),
        Provider<User>(
          create: (context) => User(),
        )
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Wrapper(),
          '/home': (context) => Home(),
        },
        debugShowCheckedModeBanner: false,
        //home: Wrapper(), //CrackQuestion(level: 1, category: 'Crack',),
      ),
    );
  }
}
