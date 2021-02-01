import 'package:flutter/material.dart';
import 'package:graduation_project_2/components/student_drawer.dart';

class StudentWelcomeScreen extends StatelessWidget {
  static String id = "Student_Welcome_Screen";
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(child: StudentDrawer()),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(35.0),
                    child: Text(
                      'Appointments',
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
            )
          ],
        ),
      ),
    );
  }
}
