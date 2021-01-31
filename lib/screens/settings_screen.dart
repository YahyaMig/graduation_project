import 'package:flutter/material.dart';
import 'package:graduation_project_2/components/avatar_image.dart';
import 'package:graduation_project_2/components/background.dart';
import 'package:graduation_project_2/components/drawer_items.dart';
import 'package:graduation_project_2/components/drawer_layout.dart';
import 'package:graduation_project_2/components/student_drawer.dart';
import 'package:graduation_project_2/screens/add_links_screen.dart';
import 'package:graduation_project_2/screens/change_password_screen.dart';
import 'package:graduation_project_2/screens/welcome_screen.dart';

class SettingScreen extends StatefulWidget {
  static String id = 'setting_screen';

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
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
          top2Image: true,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(35.0),
                      child: Text(
                        'Settings',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Stack(
                        alignment: FractionalOffset.center,
                        children: <Widget>[
                          Positioned(
                            child: Container(
                              width: 350,
                              height: 150,
                              margin: EdgeInsets.only(top: 150.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2.0,
                                  color: Colors.lightBlueAccent,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Yahya ibrahim',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 100,
                            child: AvatarPicture(
                              imagePath: 'images/avatar1.jpg',
                              borderWidth: 7.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 25.0, left: 50.0, right: 50.0),
                child: Card(
                  elevation: 25,
                  color: Colors.white70,
                  shadowColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: DrawerListItem(
                    icon: Icons.person_outline,
                    text: 'Edit Profile',
                    onTap: () {},
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 15.0, left: 50.0, right: 50.0),
                child: Card(
                  elevation: 25,
                  color: Colors.white70,
                  shadowColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: DrawerListItem(
                    icon: Icons.lock_outline,
                    text: 'Change Password',
                    onTap: () {
                      Navigator.pushNamed(context, ChangePasswordScreen.id);
                    },
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 15.0, left: 50.0, right: 50.0),
                child: Card(
                  elevation: 25,
                  color: Colors.white70,
                  shadowColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: DrawerListItem(
                    icon: Icons.language_outlined,
                    text: 'Language',
                    onTap: () {},
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 15.0, left: 50.0, right: 50.0),
                child: Card(
                  elevation: 25,
                  color: Colors.white70,
                  shadowColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: DrawerListItem(
                    icon: Icons.link_outlined,
                    text: 'Add links',
                    onTap: () {
                      Navigator.pushNamed(context, AddLinkScreen.id);
                    },
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
