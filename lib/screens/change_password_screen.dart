import 'package:flutter/material.dart';
import 'package:graduation_project_2/components/background.dart';
import 'package:graduation_project_2/components/drawer_layout.dart';
import '../constants.dart';

class ChangePasswordScreen extends StatefulWidget {
  static String id = 'change_password_screen';

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String _currentPassword;

  String _newPassword;

  String _confirmPassword;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: DrawerLayout(),
        ),
        body: SingleChildScrollView(
          child: Background(
            mainImage: true,
            bottom1Image: true,
            top1Image: true,
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
                        padding: EdgeInsets.only(top: 10.0),
                        child: Image(
                          image: AssetImage('images/changepass.png'),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 30.0),
                      child: Text(
                        'Change Password',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
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
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.center,
                      child: RaisedButton(
                        onPressed: () {},
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
                            gradient: new LinearGradient(
                              colors: [
                                Color.fromARGB(255, 50, 220, 255),
                                Color.fromARGB(255, 0, 110, 255)
                              ],
                            ),
                          ),
                          padding: const EdgeInsets.all(0),
                          child: Text(
                            "CHANGE",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
