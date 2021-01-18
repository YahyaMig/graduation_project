import 'package:flutter/material.dart';
import 'package:graduation_project_2/components/avatar_image.dart';
import 'package:graduation_project_2/components/drawer_layout.dart';
import 'package:graduation_project_2/components/user_information.dart';

class UserProfile extends StatelessWidget {
  static String id = 'userProfile_screen';
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: DrawerLayout(),
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
                            'Yahya ibrahim',
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
                                  '0777107516',
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
                                  'myemail@email.com',
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
                      height: 300,
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
                              text: 'Yahya Ibrahim',
                              textName: 'Name',
                            ),
                            UserInformation(
                              text: '+962777107516',
                              textName: 'Mobile',
                            ),
                            UserInformation(
                              text: 'myemail@email.com',
                              textName: 'Email',
                            ),
                            UserInformation(
                              text: 'Amman, Jordan',
                              textName: 'Address',
                            ),
                            UserInformation(
                              text: 'Teacher',
                              textName: 'User Type',
                            ),
                            UserInformation(
                              text: 'Mon, Tue, Wed',
                              textName: 'Availability Days',
                            ),
                            UserInformation(
                              text: 'C++, English, Python, Flutter,\n Android',
                              textName: 'Subjects',
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
