import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_2/components/alert_dialog.dart';
import 'package:graduation_project_2/constants.dart';
import 'package:graduation_project_2/screens/login_screen.dart';

void registerNewUser(
    BuildContext context, FirebaseAuth firebaseAuth) async {
  try {
    if (kUser.isValidEmail(context) && kUser.isValidPassword(context)
        // user.isValidNumberPhone(context) &&
        // user.isAdult(context)
        ) {
      final newUser = await firebaseAuth.createUserWithEmailAndPassword(
          email: kUser.email, password: kUser.password);

      if (newUser != null) {
        print(kUser.toJson());
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
