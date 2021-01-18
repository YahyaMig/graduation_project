import 'package:flutter/material.dart';
import 'package:graduation_project_2/components/avatar_image.dart';
import 'package:graduation_project_2/components/drawer_items.dart';
import 'package:graduation_project_2/components/drawer_layout.dart';

class SettingScreen extends StatelessWidget {
  static String id = 'setting_screen';

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: DrawerLayout(),
      ),
      body: SafeArea(
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
              padding: const EdgeInsets.only(left: 40, top: 40),
              child: DrawerListItem(
                icon: Icons.person_outline,
                text: 'Edit Profile',
                onTap: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: DrawerListItem(
                icon: Icons.lock_outline,
                text: 'Change Password',
                onTap: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: DrawerListItem(
                icon: Icons.language_outlined,
                text: 'Language',
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
