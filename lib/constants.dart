import 'dart:convert';
import 'package:flutter/material.dart';
import 'classes/UserType.dart';
import 'classes/course.dart';
import 'package:http/http.dart' as http;

import 'components/alert_dialog.dart';

const String apiLink =
    'https://wkn2rme5hi.execute-api.us-east-1.amazonaws.com/test';
int departmentID = 0;
UserType kUser;
List<Course> availableCourses;
UserType clientProfile;

int selectedTimeFrom;
int selectedTimeTo;
String selectedLocation;
int studentID;
int teacherID;

void setClientProfile(UserType client) async {
  clientProfile = client;
  clientProfile.courses.clear();

  var information = await invokeAPI(
      'retrieve_coursesFromTeacher', {'teacher_id': clientProfile.userID});
  Map<String, dynamic> courses = information['courses'];
  courses.forEach((k, v) =>
      clientProfile.courses.add(Course(v['courseID'], v['courseName'])));

  clientProfile.setLinks();
}

// ignore: missing_return
TimeOfDay getTime(TimeOfDay time, context) {
  if (time == null) {
    showAlertDialog(
        context, 'Wrong time', 'Make sure to select start hour first!');
  } else
    return TimeOfDay(hour: time.hour + 1, minute: time.minute);
}

void getAvailableCourses(int departmentID) async {
  availableCourses = new List<Course>();

  Map<String, int> data = {"department_id": departmentID};
  print(departmentID);

  dynamic information = await invokeAPI('retrieve_courses', data);
  Map<String, dynamic> courses = information['courses'];
  courses.forEach(
      (k, v) => availableCourses.add(Course(v['courseID'], v['courseName'])));
  print(courses);
}

void createUser() {
  kUser = UserType();
}

void setUserInformation(dynamic information) {
  dynamic data = information['data'];

  String fullName = data['FullName'];
  int userID = data['user_id'];
  int phoneNumber = data['phone_number'];
  String address = data['address'];
  String userEmail = data['email'];
  int userGender = data['gender'];

  kUser.updateInfo(
      fullName: fullName,
      phone: phoneNumber,
      address: address,
      email: userEmail,
      gender: userGender == 1 ? true : false,
      userID: userID);

  Map<String, dynamic> courses = information['courses'];
  courses.forEach(
      (k, v) => kUser.courses.add(Course(v['courseID'], v['courseName'])));

  kUser.setLinks();
}

Future<dynamic> invokeAPI(String operation, Map<String, dynamic> data) async {
  http.Response result = await http.post(
    apiLink,
    body: jsonEncode(
      <String, dynamic>{
        'operation': operation,
        'data': data,
      },
    ),
  );
  return jsonDecode(result.body);
}

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kTextCardStyle = TextStyle(
  color: Colors.purple,
  fontWeight: FontWeight.bold,
  fontSize: 15.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kTextFieldDecoration = InputDecoration(
  hintText: '',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const phoneRegularExpression = "^(?:[+0]9)?[0-9]{10}\$";
