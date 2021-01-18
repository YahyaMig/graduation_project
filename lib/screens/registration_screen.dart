import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_2/classes/UserType.dart';
import 'package:graduation_project_2/components/round_button.dart';
import 'package:graduation_project_2/components/text_field_container.dart';
import 'package:graduation_project_2/logo.dart';
import 'package:graduation_project_2/services/registeration_activity.dart';
import '../Styles.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registeration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final _fireStore = Firestore.instance;
  final _auth = FirebaseAuth.instance;
  final _user = UserType();
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
                        _user.address = value;
                      },
                    ),
                    TextFieldContainer(
                      hintText: 'Email',
                      onChanged: (value) {
                        _user.email = value;
                      },
                    ),
                    TextFieldContainer(
                      hintText: 'Password',
                      onChanged: (value) {
                        _user.password = value;
                      },
                    ),
                    TextFieldContainer(
                      hintText: 'Phone',
                      onChanged: (value) {
                        _user.phone = value;
                      },
                    ),
                    TextFieldContainer(
                      hintText: 'Address',
                      onChanged: (value) {
                        _user.address = value;
                      },
                    ),
                    TextFieldContainer(
                      hintText: 'City',
                      onChanged: (value) {
                        _user.city = value;
                      },
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Radio(
                              value: true,
                              groupValue: _user.gender,
                              onChanged: (value) {
                                setState(() {
                                  _user.gender = value;
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
                              groupValue: _user.gender,
                              onChanged: (value) {
                                setState(() {
                                  _user.gender = value;
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
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Radio(
                              value: true,
                              groupValue: _user.type,
                              onChanged: (value) {
                                setState(() {
                                  _user.type = value;
                                });
                              }),
                          Text(
                            'Student',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Radio(
                              value: false,
                              groupValue: _user.type,
                              onChanged: (value) {
                                setState(() {
                                  _user.type = value;
                                });
                              }),
                          Text(
                            'Teacher',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    RoundButton(
                        textValue: 'Birthday',
                        onPressed: () => showDatePicker(
                            errorFormatText: 'Enter valid date',
                            errorInvalidText: 'Enter date in valid range',
                            helpText: 'Pick your birthday',
                            context: context,
                            initialDate: selectedDate,
                            firstDate: DateTime(1950),
                            lastDate: DateTime(2022),
                            initialDatePickerMode: DatePickerMode.year),
                        color: Colors.lightBlueAccent),
                    SizedBox(
                      height: 9.0,
                    ),
                    Hero(
                      tag: 'register button',
                      child: RoundButton(
                        textValue: 'Register',
                        color: Colors.blueAccent,
                        onPressed:(){
                          registerNewUser(context, _user, _auth, _fireStore);
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
