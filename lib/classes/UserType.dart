import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_2/classes/appoitment.dart';
import 'package:graduation_project_2/classes/course.dart';
import 'package:graduation_project_2/classes/multi_media.dart';
import 'package:graduation_project_2/components/alert_dialog.dart';
import 'package:graduation_project_2/constants.dart';
import 'package:graduation_project_2/screens/login_screen.dart';
import 'package:password_strength/password_strength.dart';
import 'package:intl/intl.dart';
import 'available_appointment.dart';

class UserType {
  String fName = '';
  String email = '';
  String password;
  String address = '';
  String city = '';
  String country = 'Jordan';

  MultiMedia multiMediaLinks;

  DateTime dateOfBirth = DateTime(2015);

  int userID;
  // male = 1, female = 0
  bool gender = true;
  String finalGender;
  bool isStudent;
  bool isActive = false;
  int phoneNumber = 0;
  int timeFrom;
  int timeTo;
  List<Course> courses = new List<Course>();
  List<Appointment> appointments = new List<Appointment>();
  AvailableAppointment availableTime = new AvailableAppointment();
  UserType(
      {this.fName,
      this.email,
      this.address,
      this.phoneNumber,
      this.gender,
      this.userID}) {
    multiMediaLinks = new MultiMedia();
    this.getAppointments();
  }

  String getAddress() {
    return city != null ? '$city $address' : address;
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
    RegExpMatch match = phoneReg.firstMatch(phoneNumber.toString());

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

  String getCourses() {
    String allCourses = '';
    for (Course course in courses) {
      allCourses += ' ${course.courseName}';
      if (course != courses.last) allCourses += ',';
    }

    return allCourses;
  }

  Map<String, dynamic> toJson() => {
        "FullName": this.fName,
        "phone_number": this.phoneNumber,
        "address": 'amman',
        "email": this.email,
        "user_type": 1,
        "gender": 1,
      };

  void updateInfo(
      {String fullName,
      String email,
      String password,
      int phone,
      String address,
      String city,
      bool gender,
      int userID}) {
    this.fName = fullName;
    this.email = email;
    this.password = password;
    this.phoneNumber = phone;
    this.city = city;
    this.address = address;
    this.gender = gender ? true : false;
    this.userID = userID;

    LoginScreen.isStudent ? getStudentAppointments() : this.getAppointments();
  }

  UserType setUserInformation(dynamic information, {bool temp = false}) {
    Map<String, dynamic> data;
    if (!temp)
      data = information['data'];
    else
      data = information;

    String fullName = data['FullName'];
    int userID = data['user_id'];
    int phoneNumber = data['phone_number'];
    String address = data['address'];
    String userEmail = data['email'];
    int userGender = data['gender'];

    this.fName = fullName;
    this.userID = userID;
    this.phoneNumber = phoneNumber;
    this.address = address;
    this.email = userEmail;
    this.gender = userGender == 1 ? true : false;

    if (data.containsKey(courses)) {
      Map<String, dynamic> courses = information['courses'];
      courses.forEach(
          (k, v) => this.courses.add(Course(v['courseID'], v['courseName'])));
    }

    return this;
  }

  String getName() {
    return this.fName;
  }

  void getAppointments() async {
    print('im at appointments');
    Map<String, dynamic> data = {"teacher_id": this.userID};

    dynamic information = await invokeAPI('retrieve_appointment', data);

    Map<String, dynamic> appointments = information['appointment_inforamtion'];

    this.appointments.clear();
    print(appointments);
    if (appointments != null) {
      appointments.forEach((k, v) {
        this.appointments.add(Appointment(
            appointmentID: v['appointmentID'],
            studentID: v['studentID'],
            teacherID: v['teacherID'],
            timeFrom: v['timeFrom'],
            timeTo: v['timeTo'],
            location: v['location']));
      });
    }
  }

  Future<List<Appointment>> getAllAppointments() async {
    return this.appointments;
  }

  void setLinks() async {
    Map<String, dynamic> data = {"user_id": this.userID};
    dynamic response = await invokeAPI('retrieve_link', data);

    if (response['status_code'] == 200) {
      if (response['links']['youtube'] != null)
        this.multiMediaLinks.youtubeLink = response['links']['youtube'];

      if (response['links']['link2'] != null)
        this.multiMediaLinks.dropboxLink = response['links']['dropbox'];
    } else
      print('Something went wrong');
  }

  void getStudentAppointments() async {
    Map<String, dynamic> data = {"student_id": this.userID};

    dynamic information =
        await invokeAPI('retrevie_appointments_by_student_id', data);

    Map<String, dynamic> appointments = information['appointment_inforamtion'];

    this.appointments.clear();
    if (appointments != null) {
      appointments.forEach((k, v) {
        this.appointments.add(Appointment(
            appointmentID: v['appointmentID'],
            studentID: v['studentID'],
            teacherID: v['teacherID'],
            timeFrom: v['timeFrom'],
            timeTo: v['timeTo'],
            location: v['location']));
      });
    }
  }

  void getTeacherAvailableTime() async {
    Map<String, dynamic> data = {"teacher_id": this.userID};
    dynamic information = await invokeAPI('get_availbleTime', data);
    dynamic temp = information['AvailbleTime_information'];

    this.availableTime.timeFrom = temp['timeFrom'];
    this.availableTime.timeTo = temp['timeTo'];
    this.availableTime.location = temp['location'];
    this.availableTime.appointmentID = temp['appointment_id'];

    print(information);
  }
}
