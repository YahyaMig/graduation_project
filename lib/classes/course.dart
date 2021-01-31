class Course {
  String courseName;
  int courseID;
  Course(this.courseID, this.courseName);

  @override
  String toString() {
    // TODO: implement toString
    return '${courseName[0].toUpperCase()}${courseName.substring(1)}';
  }

  int getCourseID(){
    return courseID;
  }
}
