import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_2/screens/add_links_screen.dart';
import 'package:graduation_project_2/screens/appointment_screen.dart';
import 'package:graduation_project_2/screens/change_password_screen.dart';
import 'package:graduation_project_2/screens/client_profile.dart';
import 'package:graduation_project_2/screens/course_screen.dart';
import 'package:graduation_project_2/screens/login_screen.dart';
import 'package:graduation_project_2/screens/registration_screen.dart';
import 'package:graduation_project_2/screens/settings_screen.dart';
import 'package:graduation_project_2/screens/student_welcome_screen.dart';
import 'package:graduation_project_2/screens/teacher_job_screen.dart';
import 'package:graduation_project_2/screens/user_profile.dart';
import 'package:graduation_project_2/screens/welcome_screen.dart';
import 'package:graduation_project_2/screens/add_course.dart';
import 'package:graduation_project_2/screens/select_course_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: WelcomeScreen(),
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        // ChatScreen.id : (context) => ChatScreen(user: user),
        TeacherJobScreen.id: (context) => TeacherJobScreen(),
        UserProfile.id: (context) => UserProfile(),
        SettingScreen.id: (context) => SettingScreen(),
        ChangePasswordScreen.id: (context) => ChangePasswordScreen(),
        StudentWelcomeScreen.id: (context) => StudentWelcomeScreen(),
        CourseScreen.id: (context) => CourseScreen(),
        BodyLayout.id: (context) => BodyLayout(),
        SelectCourse.id: (context) => SelectCourse(),
        AppointmentScreen.id: (context) => AppointmentScreen(),
        ClientProfile.id: (context) => ClientProfile(),
        AddLinkScreen.id: (context) => AddLinkScreen(),
      },
    );
  }
}
