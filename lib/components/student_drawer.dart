import 'package:flutter/material.dart';
import 'package:graduation_project_2/components/background.dart';
import 'package:graduation_project_2/constants.dart';
import 'package:graduation_project_2/screens/course_screen.dart';
import 'package:graduation_project_2/screens/login_screen.dart';
import 'package:graduation_project_2/screens/settings_screen.dart';
import 'package:graduation_project_2/screens/student_appointment_screen.dart';
import 'package:graduation_project_2/screens/user_profile.dart';
import 'avatar_image.dart';
import 'custom_card.dart';

class StudentDrawer extends StatelessWidget {
  const StudentDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      mainImage: true,
      child: ListView(
        padding: EdgeInsets.only(top: 40.0),
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
                        style: TextStyle(color: Colors.black, fontSize: 12.0),
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
                            style:
                                TextStyle(color: Colors.black, fontSize: 12.0),
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
            text: 'Appointments',
            onTap: () {
              if (ModalRoute.of(context).settings.name !=
                  StudentAppointmentScreen.id)
                Navigator.pushNamed(context, StudentAppointmentScreen.id);
              else
                Navigator.pop(context);
            },
          ),
          CustomCard(
            icon: Icons.person_search_outlined,
            text: 'Find teacher',
            onTap: () {
              if (ModalRoute.of(context).settings.name != CourseScreen.id)
                Navigator.pushNamed(context, CourseScreen.id);
              else
                Navigator.pop(context);
            },
          ),
          CustomCard(
            text: 'SETTINGS',
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
            text: 'LOGOUT',
            icon: Icons.logout,
          ),
        ],
      ),
    );
  }
}
