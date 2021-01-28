import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_2/classes/UserType.dart';
import 'package:graduation_project_2/classes/course.dart';
import 'package:graduation_project_2/components/alert_dialog.dart';
import 'package:graduation_project_2/components/round_button.dart';
import 'package:graduation_project_2/screens/registration_screen.dart';
import 'package:graduation_project_2/screens/student_welcome_screen.dart';
import 'package:graduation_project_2/screens/teacher_job_screen.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  static bool isStudent = true;
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void goNextScreen() async {
    Map<String, dynamic> data = {'email': email};
    dynamic information = await invokeAPI('retrieve_user', data);

    setUserInformation(information);

    if (LoginScreen.isStudent)
      Navigator.pushNamed(context, StudentWelcomeScreen.id);
    else
      Navigator.pushNamed(context, TeacherJobScreen.id);
  }

  final _auth = FirebaseAuth.instance;
  bool _saving = false;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 75.0,
                ),
                Hero(
                  tag: 'logo_img',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo_img.jpg'),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your email'),
                  onChanged: (value) {
                    email = value;
                  },
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your password'),
                  onChanged: (value) {
                    password = value;
                  },
                ),
                SizedBox(
                  height: 24.0,
                ),
                Hero(
                  tag: 'login button',
                  child: RoundButton(
                    textValue: 'Log in',
                    color: Colors.lightBlueAccent,
                    onPressed: () async {
                      try {
                        if (email != null && password != null) {
                          final user = await _auth.signInWithEmailAndPassword(
                              email: email, password: password);
                          if (user != null) {
                            goNextScreen();
                          }
                        } else
                          showAlertDialog(context, 'Wrong email or password',
                              'enter your email and password');
                      } catch (e) {
                        switch (e.message) {
                          case 'There is no user record corresponding to this identifier. The user may have been deleted.':
                            showAlertDialog(context, 'UserNotFound',
                                'There is no user record corresponding to this identifier. The user may have been deleted.');
                            break;

                          case 'The password is invalid or the user does not have a password.':
                            showAlertDialog(context, 'The password is invalid',
                                'Wrong password, if it\'s valid password or email');
                            break;

                          case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
                            showAlertDialog(context, 'A network error',
                                'timeout, interrupted connection or unreachable host');
                            break;
                          default:
                            showAlertDialog(
                                context, e.toString(), e.toString());
                            break;
                        }
                      }
                    },
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Radio(
                          value: true,
                          groupValue: LoginScreen.isStudent,
                          onChanged: (value) {
                            setState(() {
                              print(value);
                              LoginScreen.isStudent = value;
                            });
                          }),
                      Text(
                        'Student',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Radio(
                          value: false,
                          groupValue: LoginScreen.isStudent,
                          onChanged: (value) {
                            setState(() {
                              print(value);
                              LoginScreen.isStudent = value;
                            });
                          }),
                      Text(
                        'Teacher',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RegistrationScreen.id);
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Create',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
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
