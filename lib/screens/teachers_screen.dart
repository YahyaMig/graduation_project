import 'package:flutter/material.dart';
import 'package:graduation_project_2/components/avatar_image.dart';
import 'package:graduation_project_2/components/background.dart';
import 'package:graduation_project_2/constants.dart';
import 'package:graduation_project_2/screens/client_profile.dart';
import 'package:graduation_project_2/screens/select_course_screen.dart';
import 'package:graduation_project_2/screens/pick_appointment_time_student.dart';
import 'package:graduation_project_2/components/custom_card.dart';

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
                      availableCourses[SelectCourse.selectIndex]
                          .teachers[index]
                          .getTeacherAvailableTime();
                      return GestureDetector(
                        onTap: () {
                          setClientProfile(
                              availableCourses[SelectCourse.selectIndex]
                                  .teachers[index]);

                          selectedTimeFrom =
                              availableCourses[SelectCourse.selectIndex]
                                  .teachers[index]
                                  .availableTime
                                  .timeFrom;
                          selectedTimeTo =
                              availableCourses[SelectCourse.selectIndex]
                                  .teachers[index]
                                  .availableTime
                                  .timeTo;
                          studentID = kUser.userID;
                          teacherID = availableCourses[SelectCourse.selectIndex]
                              .teachers[index]
                              .userID;
                          selectedLocation =
                              availableCourses[SelectCourse.selectIndex]
                                  .teachers[index]
                                  .availableTime
                                  .location;

                          Navigator.pushNamed(context, PickAppointmentTime.id);
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
                                top: 20,
                                child: Text(
                                  availableCourses[SelectCourse.selectIndex]
                                          .teachers[index]
                                          .fName
                                          .toString() ??
                                      'null',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Positioned(
                                left: 120.0,
                                bottom: 47,
                                child: Text(
                                  'Available from ${availableCourses[SelectCourse.selectIndex].teachers[index].availableTime.timeFrom.toString()}:00 - ${availableCourses[SelectCourse.selectIndex].teachers[index].availableTime.timeTo.toString()}:00',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.5),
                                ),
                              ),
                              Positioned(
                                left: 120.0,
                                bottom: 20,
                                child: Text(
                                  'AT ${availableCourses[SelectCourse.selectIndex].teachers[index].availableTime.location}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Positioned(
                                right: 20.0,
                                top: 37.0,
                                child: GestureDetector(
                                  onTap: () => Navigator.pushNamed(
                                      context, ClientProfile.id),
                                  child: Container(
                                    height: 65,
                                    width: 70,
                                    child: CustomCard(
                                      elevation: 30.0,
                                      color: Colors.white24,
                                      shadowColor: Colors.white54,
                                      borderRadius: 10,
                                      child: Column(
                                        children: <Widget>[
                                          Icon(Icons.person_outlined),
                                          Text('Profile')
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
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
