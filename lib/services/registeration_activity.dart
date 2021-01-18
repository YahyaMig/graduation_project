import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_2/classes/UserType.dart';
import 'package:graduation_project_2/components/alert_dialog.dart';
import 'package:graduation_project_2/screens/chat_screen.dart';
import 'package:graduation_project_2/screens/teacher_job_screen.dart';
import 'package:intl/intl.dart';

void registerNewUser(BuildContext context, UserType user,
    FirebaseAuth firebaseAuth, FirebaseFirestore fireStore) async {
  try {
    if (user.isValidEmail(context) &&
        user.isValidPassword(context) &&
        // user.isValidNumberPhone(context) &&
        user.isAdult(context)) {
      print('hi');
      final newUser = await firebaseAuth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);
      print('ih');

      if (newUser != null) {
        Navigator.pushNamed(context, TeacherJobScreen.id);
        // here should the api be invoked!.
        // to add the data to the database
      }
    }
  } catch (e) {
    switch (e.message) {
      case 'There is no user record corresponding to this identifier. The user may have been deleted.':
        showAlertDialog(context, 'UserNotFound',
            'There is no user record corresponding to this identifier. The user may have been deleted.');
        break;

      case 'The password is invalid or the user does not have a password.':
        showAlertDialog(context, 'The password is invalid',
            'Wrong password, if it\'s valid password or email');
        break;

      case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
        showAlertDialog(context, 'A network error',
            'timeout, interrupted connection or unreachable host');
        break;
      // ...
      default:
        Navigator.pushNamed(context, TeacherJobScreen.id);
    }
  }
}
