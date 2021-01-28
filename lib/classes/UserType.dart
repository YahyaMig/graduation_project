import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_2/classes/course.dart';
import 'package:graduation_project_2/components/alert_dialog.dart';
import 'package:graduation_project_2/constants.dart';
import 'package:password_strength/password_strength.dart';
import 'package:intl/intl.dart';

class UserType {
  String fName='';
  String email='';
  String password;
  String address='';
  String city='';
  String country = 'Jordan';
  DateTime dateOfBirth = DateTime(2015);
  int phone=0;
  int userID;
  // male = 1, female = 0
  bool gender = true;
  String finalGender;
  List<Course> courses = new List<Course>();

  UserType(
      {this.email,
      this.fName,
      this.address,
      this.city,
      this.country,
      this.dateOfBirth,
      this.phone,
      this.userID,
      this.gender});

  String getAddress() {
    return city !=null ?'$city $address': address;
  }

  bool isValidEmail(BuildContext context) {
    if (!EmailValidator.validate(email)) {
      showAlertDialog(context, 'Invalid email', 'Please enter valid email');
      return false;
    }
    return true;
  }

  bool isValidPassword(BuildContext context) {
    if (estimatePasswordStrength(password) < 0.3) {
      showAlertDialog(context, 'Weak password', 'This password is weak!');
      return false;
    }
    return true;
  }

  bool isValidNumberPhone(BuildContext context) {
    RegExp phoneReg = new RegExp(phoneRegularExpression);
    RegExpMatch match = phoneReg.firstMatch(phone.toString());

    if (match == null) {
      showAlertDialog(context, 'Wrong phone',
          'The phone number is wrong, make sure its jordanian number');
      return false;
    }
    return true;
  }

  // 1 = male, 0 = female
  int getGender() {
    if (gender) return 1;

    return 0;
  }

  bool isAdult(BuildContext context) {
    print(dateOfBirth);

    String datePattern = "dd-MM-yyyy";

    DateTime birthDate = DateFormat(datePattern).parse(dateOfBirth.toString());
    DateTime today = DateTime.now();

    int yearDiff = today.year - birthDate.year;
    int monthDiff = today.month - birthDate.month;
    int dayDiff = today.day - birthDate.day;

    if (yearDiff > 18 || yearDiff == 18 && monthDiff >= 0 && dayDiff >= 0) {
      showAlertDialog(
          context, 'Invalid birthdate', 'You must be older than 18 years old!');
      return false;
    }
    return true;
  }

  String getCourses(){
    String allCourses = '';
    for(Course course in courses){
      allCourses += ' ${course.courseName}';
      if (course != courses.last)
        allCourses += ',';
    }

    return allCourses;
  }

  Map<String, dynamic> toJson() => {
    "FullName": fName,
    "phone_number": phone,
    "address": getAddress(),
    "email": email,
    "user_type": 1,
    "gender": gender,
  };
}
