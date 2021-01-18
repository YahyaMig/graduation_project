import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_2/screens/chat_screen.dart';
import 'package:graduation_project_2/screens/login_screen.dart';
import 'package:graduation_project_2/screens/registration_screen.dart';
import 'package:graduation_project_2/screens/settings_screen.dart';
import 'package:graduation_project_2/screens/teacher_job_screen.dart';
import 'package:graduation_project_2/screens/user_profile.dart';
import 'package:graduation_project_2/screens/welcome_screen.dart';

import 'models/user_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final UserInformation user = UserInformation(id: 123, name: 'yahya', imageUrl:'images/avatar1.jpg');
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: WelcomeScreen(),
      routes: {
        WelcomeScreen.id : (context) => WelcomeScreen(),
        LoginScreen.id : (context) => LoginScreen(),
        RegistrationScreen.id : (context) => RegistrationScreen(),
        ChatScreen.id : (context) => ChatScreen(user: user),
        TeacherJobScreen.id : (context) => TeacherJobScreen(),
        UserProfile.id : (context) => UserProfile(),
        SettingScreen.id : (context) => SettingScreen(),


      },
    );
  }
}
