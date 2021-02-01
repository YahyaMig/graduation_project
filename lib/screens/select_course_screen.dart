import 'package:flutter/material.dart';
import 'package:graduation_project_2/components/background.dart';
import 'package:graduation_project_2/screens/login_screen.dart';
import 'package:graduation_project_2/screens/teachers_screen.dart';
import '../constants.dart';
import 'package:graduation_project_2/components/alert_dialog.dart';

class SelectCourse extends StatefulWidget {
  static String id = 'SelectCourse';
  static int selectIndex = 0;
  @override
  _SelectCourseState createState() => _SelectCourseState();
}

class _SelectCourseState extends State<SelectCourse> {
  showAlert(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add course'),
          content: Text(
              "Are you sure you want to add ${availableCourses[index]} to your courses ?"),
          actions: <Widget>[
            FlatButton(
              child: Text("YES"),
              onPressed: () async {
                Map<String, dynamic> data = {
                  "user_id": kUser.userID,
                  "course_id": availableCourses[index].getCourseID()
                };

                dynamic information = await invokeAPI('add_course', data);

                if (information['Result'] == 'already exist')
                  showAlertDialog(context, 'Register error',
                      'You already registered in this course');
                else
                  showAlertDialog(context, 'Register Success', 'Course added!');
              },
            ),
            FlatButton(
              child: Text("CANCEL"),
              onPressed: () {
                //Put your code here which you want to execute on No button click.
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Courses')),
      body: Background(
        mainImage: true,
        top2Image: true,
        bottom1Image: true,
        child: ListView.builder(
          itemCount: availableCourses.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Card(
                elevation: 25,
                color: Colors.white70,
                shadowColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                margin: EdgeInsets.all(10.0),
                child: ListTile(
                  title: Text(availableCourses[index].toString()),
                ),
              ),
              onTap: () {
                LoginScreen.isStudent
                    ? Navigator.pushNamed(context, TeachersScreen.id)
                    : showAlert(context, index);
              },
            );
          },
        ),
      ),
    );
  }
}
