import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_2/components/alert_dialog.dart';
import 'package:graduation_project_2/components/background.dart';
import 'package:graduation_project_2/components/custome_text_field.dart';
import 'package:graduation_project_2/constants.dart';
import 'package:graduation_project_2/screens/registration_screen.dart';
import 'package:graduation_project_2/screens/student_welcome_screen.dart';
import 'package:graduation_project_2/screens/teacher_job_screen.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'loginScreen';
  static bool isStudent = false;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createUser();
  }

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    Size size = MediaQuery.of(context).size;

    void goNextScreen() async {
      Map<String, dynamic> data = {'email': kUser.email};

      dynamic information = await invokeAPI('retrieve_user', data);

      print(information);
      setUserInformation(information);

      if (LoginScreen.isStudent)
        Navigator.pushNamedAndRemoveUntil(
            context, StudentWelcomeScreen.id, (route) => false);
      else
        Navigator.pushNamedAndRemoveUntil(
            context, TeacherJobScreen.id, (route) => false);
    }

    Future signIn(String email, String _password, FirebaseAuth _auth) async {
      try {
        dynamic _user;
        if (email != null && _password != null) {
          dynamic _user = await _auth.signInWithEmailAndPassword(
              email: email, password: _password);
          if (_user != null) {
            goNextScreen();
          }
        } else {
          showAlertDialog(context, 'Wrong email or password',
              'enter your email and password');
        }
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
            showAlertDialog(context, e.toString(), e.toString());
            break;
        }
      }
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Background(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2661FA),
                      fontSize: 36,
                      fontFamily: 'Source Sans Pro',
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                kTextField(
                  hintText: 'Email',
                  onChanged: (value) {
                    kUser.email = value;
                  },
                ),
                SizedBox(height: size.height * 0.03),
                kTextField(
                  hintText: 'Password',
                  isPassword: true,
                  onChanged: (value) {
                    kUser.password = value;
                  },
                ),
                SizedBox(height: size.height * 0.02),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Radio(
                          value: true,
                          groupValue: LoginScreen.isStudent,
                          onChanged: (value) {
                            setState(() {
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
                SizedBox(height: size.height * 0.03),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: Text(
                    "Forgot your password?",
                    style: TextStyle(fontSize: 12, color: Color(0XFF2661FA)),
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: RaisedButton(
                    onPressed: () async {
                      await signIn(kUser.email, kUser.password, _auth);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      width: size.width * 0.5,
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(80.0),
                          gradient: new LinearGradient(colors: [
                            Color.fromARGB(255, 255, 136, 34),
                            Color.fromARGB(255, 255, 177, 41)
                          ])),
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        "LOGIN",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: GestureDetector(
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()))
                    },
                    child: Text(
                      "Don't Have an Account? Sign up",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2661FA)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
