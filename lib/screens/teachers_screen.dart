import 'package:flutter/material.dart';
import 'package:graduation_project_2/components/avatar_image.dart';
import 'package:graduation_project_2/components/background.dart';
import 'package:graduation_project_2/constants.dart';
import 'package:graduation_project_2/screens/client_profile.dart';
import 'package:graduation_project_2/screens/select_course_screen.dart';

class TeachersScreen extends StatefulWidget {
  static String id = 'Teacher_screen';
  @override
  _TeachersScreenState createState() => _TeachersScreenState();
}

class _TeachersScreenState extends State<TeachersScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    availableCourses[SelectCourse.selectIndex].getTeachers();
    print(availableCourses[SelectCourse.selectIndex].teachers[0].fName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Teachers for this course')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Background(
            mainImage: true,
            top2Image: true,
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: ListView.builder(
                    itemCount: availableCourses[SelectCourse.selectIndex]
                        .teachers
                        .length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setClientProfile(
                              availableCourses[SelectCourse.selectIndex]
                                  .teachers[index]);
                          Navigator.pushNamed(context, ClientProfile.id);
                        },
                        child: Card(
                          elevation: 25,
                          color: Colors.white70,
                          shadowColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          margin: EdgeInsets.all(10.0),
                          child: Stack(
                            children: <Widget>[
                              AvatarPicture(
                                imagePath: 'images/avatar1.jpg',
                                borderWidth: 1,
                              ),
                              Positioned(
                                left: 120.0,
                                top: 30,
                                child: Text(
                                  availableCourses[SelectCourse.selectIndex]
                                          .teachers[index]
                                          .fName
                                          .toString() ??
                                      'null',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              // Positioned(
                              //   left: 120.0,
                              //   bottom: 37,
                              //   child: Text(
                              //     'Time ${availableCourses[SelectCourse.selectIndex].teachers[index].appointments[index].timeFrom}:00 - ${availableCourses[SelectCourse.selectIndex].teachers[index].appointments[index].timeTo}:00' ?? 'null',
                              //     style: TextStyle(fontWeight: FontWeight.bold),
                              //   ),
                              // ),
                              Positioned(
                                left: 120.0,
                                bottom: 10,
                                child: Text(
                                  'AT ${availableCourses[SelectCourse.selectIndex].teachers[index].gender.toString()}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Positioned(
                                right: 30.0,
                                bottom: 60,
                                child: Text(
                                  'Contact me!',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              // Positioned(
                              //   right: 30.0,
                              //   bottom: 30,
                              //   child: Text(
                              //     '0${availableCourses[SelectCourse.selectIndex].teachers[SelectCourse.selectIndex].appointments[SelectCourse.selectIndex].user.phoneNumber}',
                              //     style: TextStyle(fontWeight: FontWeight.bold),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
