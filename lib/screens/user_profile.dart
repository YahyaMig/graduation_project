import 'package:flutter/material.dart';
import 'package:graduation_project_2/components/avatar_image.dart';
import 'package:graduation_project_2/components/drawer_layout.dart';
import 'package:graduation_project_2/components/student_drawer.dart';
import 'package:graduation_project_2/components/user_information.dart';
import 'package:graduation_project_2/screens/welcome_screen.dart';
import '../constants.dart';

class UserProfile extends StatefulWidget {
  static String id = 'userProfile_screen';
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: WelcomeScreen.isStudent ? StudentDrawer() : DrawerLayout(),
      ),
      body: SafeArea(
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
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    'Profile',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Stack(
                      alignment: FractionalOffset.center,
                      children: <Widget>[
                        Container(
                          width: 350,
                          height: 150,
                          margin: EdgeInsets.only(top: 60.0),
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 2.0,
                                color: Colors.lightBlueAccent,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                        Positioned(
                          bottom: 100,
                          child: AvatarPicture(
                            imagePath: 'images/avatar1.jpg',
                            borderWidth: 7.0,
                          ),
                        ),
                        Positioned(
                          top: 115.0,
                          child: Text(
                            kUser.fName,
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Positioned(
                          right: 40.0,
                          top: 150,
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.phone_android_outlined,
                                color: Colors.lightBlueAccent,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '0${kUser.phone.toString()}',
                                  style: TextStyle(color: Colors.black),
                                ),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          left: 27.0,
                          top: 150,
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.email_outlined,
                                color: Colors.lightBlueAccent,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  kUser.email,
                                  style: TextStyle(color: Colors.black),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      width: 350,
                      height: 250,
                      margin: EdgeInsets.only(top: 60.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.deepPurple,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 10.0,
                            ),
                            UserInformation(
                              text: kUser.fName,
                              textName: 'Name',
                            ),
                            UserInformation(
                              text: '0${kUser.phone}',
                              textName: 'Mobile',
                            ),
                            UserInformation(
                              text: kUser.email,
                              textName: 'Email',
                            ),
                            UserInformation(
                              text: kUser.getAddress(),
                              textName: 'Address',
                            ),
                            UserInformation(
                              text: 'Teacher',
                              textName: 'User Type',
                            ),
                            UserInformation(
                              text: kUser.getCourses(),
                              textName: 'I can teach',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 110.0,
                      top: 50.0,
                      child: Container(
                        child: Text(
                          'Personal Information',
                          style: TextStyle(
                              fontSize: 15.0, color: Colors.deepPurple),
                        ),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
