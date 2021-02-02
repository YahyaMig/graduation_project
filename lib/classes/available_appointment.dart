class AvailableAppointment {
  int appointmentID;
  int studentID;
  int teacherID;
  int timeFrom;
  int timeTo;
  String location;

  AvailableAppointment(
      {this.appointmentID,
      this.studentID,
      this.teacherID,
      this.timeFrom,
      this.timeTo,
      this.location});

  int getTimeFrom() {
    return this.timeFrom;
  }

  int getTimeTo() {
    return this.timeTo;
  }
}
