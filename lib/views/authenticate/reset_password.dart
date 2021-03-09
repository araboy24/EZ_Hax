import 'package:ez_hax/clicky_button/clicky_button.dart';
import 'package:ez_hax/services/auth.dart';
import 'package:ez_hax/shared/constants.dart';
import 'package:ez_hax/shared/loading.dart';
import 'package:ez_hax/views/authenticate/signin.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();

  final AuthService _auth = AuthService();

  bool loading = false;

  String email = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text(
                'EZ-HAX',
                style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 40,
                    fontFamily: 'code_font'),
              ),
            ),
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/blue_black_bg.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Reset Password',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'code_font',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Email'),
                        validator: (val) =>
                            val.isEmpty ? 'Enter an Email' : null,
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ClickyButton(
                          color: Colors.blue,
                          child: Text(
                            'resetPw()',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'code_font',
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() {
                                loading = true;
                              });
                              dynamic result =
                                  await _auth.forgotPassword(email);
                              if (result == false) {
                                setState(() {
                                  error =
                                      'Please supply a valid email address.';
                                  loading = false;
                                });
                              } else {
                                setState(() {
                                  error =
                                      'Password Reset email link has been sent.';
                                  loading = false;
                                });
                              }
                            }
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        error,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ClickyButton(
                          color: Colors.blue,
                          child: Text(
                            'back2SignIn()',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'code_font',
                              fontSize: 15,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => SignIn(),
                                ));
                          })
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
