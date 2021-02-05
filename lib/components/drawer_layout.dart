import 'package:flutter/material.dart';
import 'package:graduation_project_2/components/background.dart';
import 'package:graduation_project_2/constants.dart';
import 'package:graduation_project_2/screens/appointment_screen.dart';
import 'package:graduation_project_2/screens/delete_course_screen.dart';
import 'package:graduation_project_2/screens/login_screen.dart';
import 'package:graduation_project_2/screens/settings_screen.dart';
import 'package:graduation_project_2/screens/student_appointment_screen.dart';
import 'package:graduation_project_2/screens/teacher_job_screen.dart';
import 'package:graduation_project_2/screens/user_profile.dart';
import 'package:graduation_project_2/screens/add_course.dart';
import 'avatar_image.dart';
import 'custom_card.dart';

class DrawerLayout extends StatefulWidget {
  const DrawerLayout({
    Key key,
  }) : super(key: key);

  @override
  _DrawerLayoutState createState() => _DrawerLayoutState();
}

class _DrawerLayoutState extends State<DrawerLayout> {
  @override
  Widget build(BuildContext context) {
    return Background(
      mainImage: true,
      child: Stack(
        children: [
          SizedBox(
            height: 10.0,
          ),
          ListView(
            padding: EdgeInsets.only(top: 60.0),
            // Important: Remove any padding from the ListView.
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: 50,
                    margin: EdgeInsets.all(10),
                    shadowColor: Colors.blueAccent,
                    color: Colors.white54,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      width: 250.0,
                      child: Column(
                        children: <Widget>[
                          AvatarPicture(
                            imagePath: 'images/avatar1.jpg',
                            borderWidth: 1.0,
                          ),
                          Text(
                            kUser.email,
                            style:
                                TextStyle(color: Colors.black, fontSize: 12.0),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.online_prediction,
                                size: 16,
                                color: Colors.green,
                              ),
                              Text(
                                '  Active',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12.0),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              CustomCard(
                icon: Icons.person_outline,
                text: 'Profile',
                onTap: () {
                  if (ModalRoute.of(context).settings.name != UserProfile.id)
                    Navigator.pushNamed(context, UserProfile.id);
                  else
                    Navigator.pop(context);
                },
              ),
              CustomCard(
                icon: Icons.calendar_today_outlined,
                text: 'Appointment',
                onTap: () {
                  Navigator.pushNamed(context, AppointmentScreen.id);
                },
              ),
              CustomCard(
                icon: Icons.person_search_outlined,
                text: 'Job Search',
                onTap: () {
                  if (ModalRoute.of(context).settings.name !=
                      TeacherJobScreen.id)
                    Navigator.pushNamed(context, TeacherJobScreen.id);
                  else
                    Navigator.pop(context);
                },
              ),
              CustomCard(
                icon: Icons.person_search_outlined,
                text: 'Add Courses to teach',
                onTap: () {
                  if (ModalRoute.of(context).settings.name != BodyLayout.id)
                    Navigator.pushNamed(context, BodyLayout.id);
                  else
                    Navigator.pop(context);
                },
              ),
              CustomCard(
                text: 'Delete courses',
                icon: Icons.settings_outlined,
                onTap: () {
                  if (ModalRoute.of(context).settings.name !=
                      DeleteCourseScreen.id)
                    Navigator.pushNamed(context, DeleteCourseScreen.id);
                  else
                    Navigator.pop(context);
                },
              ),
              CustomCard(
                text: 'Settings',
                icon: Icons.settings_outlined,
                onTap: () {
                  if (ModalRoute.of(context).settings.name != SettingScreen.id)
                    Navigator.pushNamed(context, SettingScreen.id);
                  else
                    Navigator.pop(context);
                },
              ),
              CustomCard(
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                    context, LoginScreen.id, (route) => false),
                text: 'Logout',
                icon: Icons.logout,
              ),
            ],
          ),
          Positioned(
            top: 4,
            child: Container(
              margin: EdgeInsets.only(left: 20.0, right: 100.0),
              child: CustomCard(
                borderRadius: 3,
                color: Colors.white38,
                shadowColor: Colors.white54,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Switch user',
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Switch(
                      value: LoginScreen.isStudent,
                      onChanged: (value) {
                        setState(() {
                          LoginScreen.isStudent = value;
                          if (LoginScreen.isStudent)
                            Navigator.pushNamedAndRemoveUntil(context,
                                StudentAppointmentScreen.id, (route) => false);
                          else
                            Navigator.pushNamedAndRemoveUntil(
                                context, TeacherJobScreen.id, (route) => false);
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
