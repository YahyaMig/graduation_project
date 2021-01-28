import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_2/classes/UserType.dart';
import 'package:graduation_project_2/components/alert_dialog.dart';
import 'package:graduation_project_2/constants.dart';
import 'package:graduation_project_2/screens/login_screen.dart';
import 'package:graduation_project_2/screens/teacher_job_screen.dart';

void registerNewUser(
    BuildContext context, UserType user, FirebaseAuth firebaseAuth) async {
  try {
    if (user.isValidEmail(context) && user.isValidPassword(context)
        // user.isValidNumberPhone(context) &&
        // user.isAdult(context)
        ) {
      final newUser = await firebaseAuth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);

      if (newUser != null) {
        dynamic result = await invokeAPI('add_user', kUser.toJson());
        if (result['status_code'] == 200){
          Navigator.pushNamed(context, LoginScreen.id);
        }

      }
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      showAlertDialog(context, 'The password is invalid',
          'The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      showAlertDialog(context, 'The password or email is invaild',
          'The account already exists for that email.');
    }
  }
}
