import 'package:flutter/material.dart';
import 'package:graduation_project_2/components/background.dart';
import 'package:graduation_project_2/screens/select_course_screen.dart';
import '../constants.dart';

class CourseScreen extends StatelessWidget {
  static String id = 'BodyLayout';

  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

Widget _myListView(BuildContext context) {

  final titles = ['IT', 'Medical', 'Engineering'];
  final icons = [
    Icons.computer,
    Icons.medical_services_outlined,
    Icons.engineering_outlined
  ];


  return Scaffold(
      appBar: AppBar(
        title: Text('Select department'),
      ),
      body: Background(
        mainImage: true,
        top1Image: true,
        child: ListView.builder(
          itemCount: titles.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async {
                departmentID = index;
                await getAvailableCourses(departmentID + 1);

                Navigator.pushNamed(context, SelectCourse.id);
              },
              child: Card(
                elevation: 25,
                color: Colors.white70,
                shadowColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                margin: EdgeInsets.all(10.0),
                child: ListTile(
                  leading: Icon(icons[index]),
                  title: Text(titles[index]),
                ),
              ),
            );
          },
        ),
      ));
}
