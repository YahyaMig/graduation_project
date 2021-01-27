import 'package:flutter/material.dart';
import 'package:graduation_project_2/components/drawer_layout.dart';
import 'package:graduation_project_2/components/round_button.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChangePasswordScreen extends StatelessWidget {
  static String id = 'change_password_screen';

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String _currentPassword;
  String _newPassword;
  String _confirmPassword;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: DrawerLayout(),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 15.0,
                left: 15.0,
                child: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                  onPressed: () => _scaffoldKey.currentState.openDrawer(),
                ),
              ),
              
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Container(

                      padding: EdgeInsets.only(top:75.0),
                      child: Image(
                        image: AssetImage('images/changepass.png'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 30.0),
                    child: Text(
                      'Change Password',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25.0),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 30.0, top: 25.0, right: 30.0),
                    child: TextField(
                      obscureText: true,
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: '🔒        Current Password'),
                      onChanged: (value) {
                        _currentPassword = value;
                      },
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 30.0, top: 20.0, right: 30.0),
                    child: TextField(
                      obscureText: true,
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: '🔒        New Password'),
                      onChanged: (value) {
                        _newPassword = value;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30.0, top: 20.0, right: 30.0),
                    child: TextField(
                      obscureText: true,
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: '🔒        Confirm Password'),
                      onChanged: (value) {
                        _confirmPassword = value;
                      },
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 160.0,
                      margin: EdgeInsets.all(10.0),
                      child: RoundButton(
                        textValue: 'Submit',
                        color: Colors.blueAccent,
                        onPressed: () {
                          if (_newPassword == _confirmPassword) {}
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
