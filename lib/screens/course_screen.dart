import 'package:flutter/material.dart';
import 'package:graduation_project_2/components/course_catagories.dart';
import 'package:graduation_project_2/components/student_drawer.dart';

import '../constants.dart';

class CourseScreen extends StatefulWidget {
  static String id = "course_screen";
  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: StudentDrawer(),
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
                      'Courses',
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
              ],
            ),
            SingleChildScrollView(
              child: Container(
                height: 600,
                width: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.grey)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Course(
                      imageUrl:
                          'https://www.educative.io/api/page/5393602882568192/image/download/6038586442907648',
                      onPressed: () {},
                    ),
                    Course(
                      imageUrl:
                      'https://miro.medium.com/max/601/1*PPIp7twJJUknfohZqtL8pQ.png',
                      onPressed: () {},
                    ),

                    Course(
                      imageUrl:
                      'https://miro.medium.com/max/2400/1*iIXOmGDzrtTJmdwbn7cGMw.png',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
