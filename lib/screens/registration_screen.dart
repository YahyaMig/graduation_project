import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_2/classes/UserType.dart';
import 'package:graduation_project_2/components/round_button.dart';
import 'package:graduation_project_2/components/text_field_container.dart';
import 'package:graduation_project_2/logo.dart';
import 'package:graduation_project_2/screens/teacher_job_screen.dart';
import 'package:graduation_project_2/services/registeration_activity.dart';
import '../Styles.dart';
import '../constants.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registeration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final _fireStore = Firestore.instance;
  final _auth = FirebaseAuth.instance;
  final controller = ScrollController();

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                MyLogo(),
                Row(
                  children: <Widget>[
                    Text('Sign Up', style: kMessageTextStyle),
                  ],
                ),
                SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: <Widget>[
                    Text('Create your account'),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 48.0,
                    ),
                    TextFieldContainer(
                      hintText: 'Fullname',
                      onChanged: (value) {
                        kUser.address = value;
                      },
                    ),
                    TextFieldContainer(
                      hintText: 'Email',
                      onChanged: (value) {
                        kUser.email = value;
                      },
                    ),
                    TextFieldContainer(
                      hintText: 'Password',
                      onChanged: (value) {
                        kUser.password = value;
                      },
                    ),
                    TextFieldContainer(
                      hintText: 'Phone',
                      onChanged: (value) {
                        kUser.phone = value;
                      },
                    ),
                    TextFieldContainer(
                      hintText: 'Address',
                      onChanged: (value) {
                        kUser.address = value;
                      },
                    ),
                    TextFieldContainer(
                      hintText: 'City',
                      onChanged: (value) {
                        kUser.city = value;
                      },
                    ),
                    SizedBox(
                      height: 8.0,
                    ),

                    Container(
                      child: InputDatePickerFormField(
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2021),
                        onDateSaved: (value){
                          kUser.dateOfBirth = value;
                        },
                      ),
                    ),

                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Radio(
                              value: true,
                              groupValue: kUser.gender,
                              onChanged: (value) {
                                setState(() {
                                  kUser.gender = value;
                                });
                              }),
                          Text(
                            'Male',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            width: 38,
                          ),
                          Radio(
                              value: false,
                              groupValue: kUser.gender,
                              onChanged: (value) {
                                setState(() {
                                  kUser.gender = value;
                                });
                              }),
                          Text(
                            'Female',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 9.0,
                    ),
                    Hero(
                      tag: 'register button',
                      child: RoundButton(
                        textValue: 'Register',
                        color: Colors.blueAccent,
                        onPressed:(){
                          registerNewUser(context, kUser, _auth);
                        }
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
