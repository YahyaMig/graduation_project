import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graduation_project_2/classes/UserType.dart';
import 'package:graduation_project_2/components/avatar_image.dart';
import 'package:graduation_project_2/components/background.dart';
import 'package:graduation_project_2/constants.dart';
import 'package:graduation_project_2/screens/client_profile.dart';
import 'package:graduation_project_2/screens/select_course_screen.dart';
import 'package:graduation_project_2/screens/pick_appointment_time_student.dart';
import 'package:graduation_project_2/components/custom_card.dart';
import 'package:http/http.dart' as http;

class TeachersScreen extends StatefulWidget {
  static String id = 'Teacher_screen';
  @override
  _TeachersScreenState createState() => _TeachersScreenState();
}

class _TeachersScreenState extends State<TeachersScreen> {
  List teachers;
  List time;
  int count = 0;
  final String url =
      'https://wkn2rme5hi.execute-api.us-east-1.amazonaws.com/test';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async {
    http.Response result = await http.post(
      url,
      body: jsonEncode(
        {
          'operation': 'retrieve_teachersFromCourses',
          'data': {
            'course_id': availableCourses[SelectCourse.selectIndex].courseID
          },
        },
      ),
    );
    print(result.body);
    print(availableCourses[SelectCourse.selectIndex].courseName);
    if (this.mounted)
      setState(
        () {
          var convertedDataToJson = json.decode(result.body);
          teachers = convertedDataToJson['Teachers'];
          // print(teachers);
        },
      );

    return 'Success';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teachers for this course'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Background(
            mainImage: true,
            top2Image: true,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 105.0),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: ListView.builder(
                      itemCount: teachers == null ? 0 : teachers.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            selectedTimeFrom = teachers[index]['timeFrom'];
                            selectedTimeTo = teachers[index]['timeto'];
                            studentID = kUser.userID;
                            teacherID = teachers[index]['teacherID'];
                            selectedLocation = teachers[index]['location'];

                            Navigator.pushNamed(
                                context, PickAppointmentTime.id);
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
                                    teachers[index]['FullName'],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Positioned(
                                  left: 120.0,
                                  bottom: 47,
                                  child: Text(
                                    'Available ${teachers[index]['timeFrom'].toString()}:00 to ${teachers[index]['timeto'].toString()}:00',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.5),
                                  ),
                                ),
                                Positioned(
                                  left: 120.0,
                                  bottom: 20,
                                  child: Text(
                                    'Location ${teachers[index]['location'].toString()}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Positioned(
                                  right: 20.0,
                                  top: 37.0,
                                  child: GestureDetector(
                                    onTap: () {
                                      setClientProfile(UserType()
                                          .setUserInformation(teachers[index],
                                              temp: true));
                                      Navigator.pushNamed(
                                          context, ClientProfile.id);
                                    },
                                    child: Container(
                                      height: 65,
                                      width: 70,
                                      child: CustomCard(
                                        elevation: 30.0,
                                        color: Colors.white24,
                                        shadowColor: Colors.white54,
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
      ),
    );
  }
}
