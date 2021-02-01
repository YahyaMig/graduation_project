import 'package:flutter/material.dart';
import 'package:graduation_project_2/components/avatar_image.dart';
import 'package:graduation_project_2/components/background.dart';
import 'package:graduation_project_2/components/drawer_layout.dart';
import 'package:graduation_project_2/components/student_drawer.dart';
import 'package:graduation_project_2/screens/client_profile.dart';
import 'package:graduation_project_2/screens/login_screen.dart';

import '../constants.dart';

class StudentAppointmentScreen extends StatefulWidget {
  static String id = 'Student_Appointments_screen';
  @override
  _StudentAppointmentScreenState createState() =>
      _StudentAppointmentScreenState();
}

class _StudentAppointmentScreenState extends State<StudentAppointmentScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    kUser.getStudentAppointments();
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
                    left:90.0,
                    child: Text(
                      'Your Appointments',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                                AvatarPicture(
                                  imagePath: 'images/avatar1.jpg',
                                  borderWidth: 1,
                                ),
                                Positioned(
                                  left: 120.0,
                                  top: 30,
                                  child: Text(
                                    kUser.appointments[index].getName(),
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Positioned(
                                  left: 120.0,
                                  bottom: 37,
                                  child: Text(
                                    'Time ${kUser.appointments[index].timeFrom}:00 - ${kUser.appointments[index].timeTo}:00',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Positioned(
                                  left: 120.0,
                                  bottom: 10,
                                  child: Text(
                                    'AT ${kUser.appointments[index].location}',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Positioned(
                                  right: 30.0,
                                  bottom: 60,
                                  child: Text(
                                    'Contact me!',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Positioned(
                                  right: 30.0,
                                  bottom: 30,
                                  child: Text(
                                    '0${kUser.appointments[index].user.phoneNumber}',
                                    style: TextStyle(fontWeight: FontWeight.bold),
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
    );
  }
}
