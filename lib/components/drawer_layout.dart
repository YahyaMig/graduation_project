import 'package:flutter/material.dart';
import 'package:graduation_project_2/classes/UserType.dart';
import 'package:graduation_project_2/screens/login_screen.dart';
import 'package:graduation_project_2/screens/settings_screen.dart';
import 'package:graduation_project_2/screens/teacher_job_screen.dart';
import 'package:graduation_project_2/screens/user_profile.dart';
import 'avatar_image.dart';
import 'drawer_items.dart';

class DrawerLayout extends StatelessWidget {
  const DrawerLayout({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Row(
            children: [
              Column(
                children: <Widget>[
                  AvatarPicture(
                    imagePath: 'images/avatar1.jpg',
                    borderWidth: 1.0,
                  ),
                  Text(
                    'myemail@email.com',
                    style: TextStyle(color: Colors.white, fontSize: 10.0),
                  ),
                  Row(
                    verticalDirection: VerticalDirection.down,
                    children: <Widget>[
                      Icon(
                        Icons.online_prediction,
                        size: 14,
                        color: Colors.green,
                      ),
                      Text(
                        'Active',
                        style: TextStyle(color: Colors.white, fontSize: 11.0),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.deepPurpleAccent,
          ),
        ),
        DrawerListItem(
          icon: Icons.person_outline,
          text: 'Profile',
          onTap: () {
            if (ModalRoute.of(context).settings.name != UserProfile.id)
              Navigator.pushNamed(context, UserProfile.id);
            else
              Navigator.pop(context);
          },
        ),
        DrawerListItem(
          icon: Icons.calendar_today_outlined,
          text: 'Appointment',
          onTap: () {},
        ),
        DrawerListItem(
          icon: Icons.person_search_outlined,
          text: 'Job Search',
          onTap: () {
            if (ModalRoute.of(context).settings.name != TeacherJobScreen.id)
              Navigator.pushNamed(context, TeacherJobScreen.id);
            else
              Navigator.pop(context);
          },
        ),
        DrawerListItem(
          icon: Icons.settings_outlined,
          text: 'Settings',
          onTap: () {
            if (ModalRoute.of(context).settings.name != SettingScreen.id)
              Navigator.pushNamed(context, SettingScreen.id);
            else
              Navigator.pop(context);
          },
        ),
        DrawerListItem(
          icon: Icons.logout,
          text: 'Logout',
          onTap: () {
            Navigator.pushNamed(context, LoginScreen.id);
          },
        ),
      ],
    );
  }
}
