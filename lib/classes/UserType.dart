import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_2/components/alert_dialog.dart';
import 'package:graduation_project_2/constants.dart';
import 'package:password_strength/password_strength.dart';
import 'package:intl/intl.dart';

class UserType {
  String fName;
  String email;
  String password;
  String address;
  String city;
  String country = 'Jordan';

  DateTime dateOfBirth;
  int phone;
  // Student = 1, Teacher = 0
  bool type;
  String finalType;

  // male = 1, female = 0
  bool gender;
  String finalGender;

  UserType();

  @override
  String toString() {
    // TODO: implement toString
    return fName +
        email +
        address +
        city +
        country +
        phone.toString() +
        dateOfBirth.toString() +
        type.toString() +
        gender.toString();
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

  // 1 = Student , 2 = Teacher
  int getUserType() {
    if (type) return 1;

    return 2;
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
}