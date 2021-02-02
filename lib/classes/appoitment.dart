import 'package:graduation_project_2/classes/UserType.dart';
import 'package:graduation_project_2/constants.dart';
import 'package:graduation_project_2/screens/login_screen.dart';

class Appointment {
  int appointmentID;
  int studentID;
  int teacherID;
  int timeFrom;
  int timeTo;
  String location;
  UserType user = new UserType();
  String name;


  Appointment(
      {this.appointmentID,
      this.studentID,
      this.teacherID,
      this.timeFrom,
      this.timeTo,
      this.location}) {
    getUser();
  }

  void getUser() async {
    Map<String, int> data = {
      "user_id": LoginScreen.isStudent ? teacherID : studentID
    };

    dynamic information = await invokeAPI('retrieve_user_byID', data);
    this.user.setUserInformation(information);
    this.name = this.user.fName;
  }

  String getName() {
    return this.name;
  }

}
