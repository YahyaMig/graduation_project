import 'package:graduation_project_2/classes/UserType.dart';
import 'package:graduation_project_2/constants.dart';

class Course {
  String courseName;
  int courseID;
  List<UserType> teachers = new List<UserType>();
  Course(this.courseID, this.courseName);

  @override
  String toString() {
    // TODO: implement toString
    return '${courseName[0].toUpperCase()}${courseName.substring(1)}';
  }

  int getCourseID() {
    return courseID;
  }

  Future<List<Course>> getTeachers() async {
    Map<String, dynamic> data = {'course_id': this.courseID};

    dynamic result = await invokeAPI('retrieve_teachersFromCourses', data);

    this.teachers.clear();
    Map<String, dynamic> courseTeachers = result['Teachers'];
    courseTeachers.forEach((k, v) {
      this.teachers.add(UserType().setUserInformation(v));
    });


    return availableCourses;
  }
}
