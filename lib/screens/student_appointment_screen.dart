import 'package:flutter/material.dart';
import 'package:graduation_project_2/components/alert_dialog.dart';
import 'package:graduation_project_2/components/avatar_image.dart';
import 'package:graduation_project_2/components/background.dart';
import 'package:graduation_project_2/components/drawer_layout.dart';
import 'package:graduation_project_2/components/student_drawer.dart';
import 'package:graduation_project_2/screens/client_profile.dart';
import 'package:graduation_project_2/screens/login_screen.dart';
import 'dart:async';
import '../constants.dart';

class StudentAppointmentScreen extends StatefulWidget {
  static String id = 'Student_Appointments_screen';
  @override
  _StudentAppointmentScreenState createState() =>
      _StudentAppointmentScreenState();
}

class _StudentAppointmentScreenState extends State<StudentAppointmentScreen> {
  showAlert(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add course'),
          content: Text("Are you sure you want to delete this appointment?"),
          actions: <Widget>[
            FlatButton(
              child: Text("YES"),
              onPressed: () async {
                Map<String, int> data = {
                  "appointment_id": kUser.appointments[index].appointmentID,
                  "student_id": kUser.userID
                };
                var information =
                    await invokeAPI("delete _appointmentByStdID", data);

                print(information);

                if (information['status_code'] == 200)
                  showAlertDialog(context, 'Appointment deleted!',
                      'Appointment was deleted');
              },
            ),
            FlatButton(
              child: Text("CANCEL"),
              onPressed: () {
                //Put your code here which you want to execute on No button click.
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String now;
  Timer everySecond;
  bool _disposed = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    kUser.getStudentAppointments();

    everySecond = Timer.periodic(Duration(seconds: 3), (Timer t) {
      if (this.mounted)
        setState(() {
          now = DateTime.now().second.toString();
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: LoginScreen.isStudent ? StudentDrawer() : DrawerLayout(),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Background(
              mainImage: true,
              top2Image: true,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Stack(
                  children: [
                    Positioned(
                      top: 15.0,
                      left: 15.0,
                      child: IconButton(
                        icon: Icon(
                          Icons.menu,
                          color: Colors.black,
                        ),
                        onPressed: () => _scaffoldKey.currentState.openDrawer(),
                      ),
                    ),
                    Positioned(
                      top: 50.0,
                      left: 90.0,
                      child: Text(
                        'Your Appointments',
                        style:
                            TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: ListView.builder(
                        itemCount: kUser.appointments.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setClientProfile(kUser.appointments[index].user);
                              Navigator.pushNamed(context, ClientProfile.id);
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
                                  Positioned(
                                    right: 10,
                                    child: IconButton(
                                        icon: Icon(
                                          Icons.delete_outline,
                                          color: Colors.black,
                                        ),
                                        onPressed: () {
                                          showAlert(context, index);
                                        }),
                                  ),
                                  AvatarPicture(
                                    imagePath: 'images/avatar1.jpg',
                                    borderWidth: 1,
                                  ),
                                  Positioned(
                                    left: 120.0,
                                    top: 30,
                                    child: Text(
                                      kUser.appointments[index].name.toString(),
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Positioned(
                                    left: 120.0,
                                    bottom: 37,
                                    child: Text(
                                      'Time ${kUser.appointments[index].timeFrom}:00 - ${kUser.appointments[index].timeTo}:00',
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Positioned(
                                    left: 120.0,
                                    bottom: 10,
                                    child: Text(
                                      'AT ${kUser.appointments[index].location}',
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Positioned(
                                    right: 30.0,
                                    bottom: 50,
                                    child: Text(
                                      'Contact me!',
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Positioned(
                                    right: 30.0,
                                    bottom: 20,
                                    child: Text(
                                      '0${kUser.appointments[index].user.phoneNumber}',
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
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
      ),
    );
  }
}
