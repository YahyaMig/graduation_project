import 'package:flutter/material.dart';
import 'package:graduation_project_2/components/alert_dialog.dart';
import 'package:graduation_project_2/components/background.dart';
import 'package:graduation_project_2/components/custom_card.dart';
import 'package:graduation_project_2/constants.dart';

class DeleteCourseScreen extends StatefulWidget {
  static String id = 'DeleteCourseScreen';
  @override
  _DeleteCourseScreenState createState() => _DeleteCourseScreenState();
}

class _DeleteCourseScreenState extends State<DeleteCourseScreen> {
  showAlert(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('delete course'),
          content: Text(
              "Are you sure you want to delete ${kUser.courses[index]} from your courses ?"),
          actions: <Widget>[
            FlatButton(
              child: Text("YES"),
              onPressed: () async {
                Map<String, dynamic> data = {
                  "teacher_id": kUser.userID,
                  "course_id": kUser.courses[index].courseID
                };
                dynamic result = await invokeAPI('delete_course', data);

                if (result['status_code'] == 200)
                  showAlertDialog(context, 'Course Deleted',
                      'Please Resign in to show the updates!');
                else
                  showAlertDialog(context, 'Error', 'Something went wrong');
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select course to delete')),
      body: Background(
        mainImage: true,
        top2Image: true,
        bottom1Image: true,
        child: ListView.builder(
          itemCount: kUser.courses.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: GestureDetector(
                child: Card(
                  elevation: 25,
                  color: Colors.white70,
                  shadowColor: Colors.white,
                  child: ListTile(
                    title: Text(kUser.courses[index].toString()),
                  ),
                ),
                onTap: () {
                  print('im here');
                  showAlert(context, index);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
