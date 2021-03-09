import 'package:ez_hax/services/auth.dart';
import 'package:ez_hax/shared/constants.dart';
import 'package:ez_hax/shared/loading.dart';
import 'package:ez_hax/views/authenticate/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();

  final AuthService _auth = AuthService();

  bool loading = false;

  String email = '';
  String password = '';
  String passwordConfirm = '';
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
                        height: 30,
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
                        height: 30,
                      ),
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Password'),
                        validator: (val) => val.length < 6
                            ? 'Enter a Password 6+ chars long'
                            : null,
                        obscureText: true,
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      RaisedButton(
                        color: Colors.blueGrey,
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                          ),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              loading = true;
                            });
                            dynamic result = await _auth
                                .signInWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                error = 'Please supply a valid email address.';
                                loading = false;
                              });
                            }
                          }
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Colors.blueGrey[200],
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(width: 10,),
                          GestureDetector(
                            onTap: () {
                              //widget.toggleView();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    //TODO This is for testing purposes must be changed later
                                    builder: (BuildContext context) => ResetPassword(),
                                  ));
                            },
                            child: Text(
                              'Reset Now',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Don't Have an Account?",
                        style: TextStyle(
                          color: Colors.blueGrey[200],
                          fontSize: 15,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          widget.toggleView();
                        },
                        child: Text(
                          'Tap Here',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Transform.scale(
                        scale: 1.4,
                        child: SignInButton(
                          Buttons.GoogleDark,
                          text: "Sign In with Google",
                          // onPressed: () {
                            // _auth.signInWithGoogle().whenComplete(() {
                            //   print('signed in right?');
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //     builder: (context) {
                              //       print('signed in i think idk');
                              //       //return Home();
                              //     },
                              //   ),
                              // );
                            // });
                          // },
                          onPressed: () async {
                            dynamic result = await _auth.googleSignIn();
                            if (result == null) {
                              setState(() {
                                error = 'Please supply a valid email address.';
                                loading = false;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
