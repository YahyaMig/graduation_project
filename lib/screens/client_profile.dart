import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_2/components/avatar_image.dart';
import 'package:graduation_project_2/components/background.dart';
import 'package:graduation_project_2/components/custom_card.dart';
import 'package:graduation_project_2/components/drawer_layout.dart';
import 'package:graduation_project_2/components/student_drawer.dart';
import 'package:graduation_project_2/components/user_information.dart';
import 'package:graduation_project_2/screens/welcome_screen.dart';
import '../constants.dart';

class ClientProfile extends StatefulWidget {
  static String id = 'client_screen';
  @override
  _ClientProfileState createState() => _ClientProfileState();
}

class _ClientProfileState extends State<ClientProfile> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: WelcomeScreen.isStudent ? StudentDrawer() : DrawerLayout(),
      ),
      body: SafeArea(
        child: Background(
          mainImage: true,
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
                    height: 40.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      'PROFILE',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'Source Sans Pro'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 25,
                      color: Colors.white,
                      shadowColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      margin: EdgeInsets.only(left: 5, right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Stack(
                            alignment: FractionalOffset.center,
                            children: <Widget>[
                              Container(
                                width: 350,
                                height: 150,
                                margin: EdgeInsets.only(top: 60.0),
                              ),
                              Positioned(
                                bottom: 100,
                                child: AvatarPicture(
                                  imagePath: 'images/avatar1.jpg',
                                  borderWidth: 1,
                                ),
                              ),
                              Positioned(
                                top: 115.0,
                                child: Text(
                                  clientProfile.fName,
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Positioned(
                                right: -5.0,
                                top: 140,
                                child: CustomCard(
                                  shadowColor: Colors.grey,
                                  elevation: 2,
                                  icon: Icons.phone_outlined,
                                  text: '0${clientProfile.phoneNumber.toString()}',
                                ),
                              ),
                              Positioned(
                                left: -10,
                                top: 140,
                                child: CustomCard(
                                  shadowColor: Colors.grey,
                                  elevation: 2,
                                  icon: Icons.email_outlined,
                                  text: clientProfile.email,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
                    elevation: 10,
                    color: Colors.white,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          width: 350,
                          height: 250,
                          margin: EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
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
                                  text: clientProfile.fName,
                                  textName: 'Name',
                                ),
                                UserInformation(
                                  text: '0${clientProfile.phoneNumber}',
                                  textName: 'Mobile',
                                ),
                                UserInformation(
                                  text: kUser.getAddress(),
                                  textName: 'Address',
                                ),
                                UserInformation(
                                  text: clientProfile.getCourses(),
                                  textName: 'I can teach',
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          child: Center(
                            child: Container(
                              child: Text(
                                'Personal Information',
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.deepPurple),
                              ),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
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
