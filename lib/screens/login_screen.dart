import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_2/components/alert_dialog.dart';
import 'package:graduation_project_2/components/round_button.dart';
import 'package:graduation_project_2/screens/registration_screen.dart';
import 'package:graduation_project_2/screens/student_welcome_screen.dart';
import 'package:graduation_project_2/screens/teacher_job_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../constants.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool _saving = false;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
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
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
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
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (user != null) {
                        Navigator.pushNamed(context, TeacherJobScreen.id);
                      }

                      setState(() {
                        _saving = false;
                      });
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
                          Navigator.pushNamed(context, TeacherJobScreen.id);
                          break;
                      }
                    }

                    Navigator.pushNamed(context, StudentWelcomeScreen.id);
                  },
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
    );
  }
}
