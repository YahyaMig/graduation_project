import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project_2/components/alert_dialog.dart';
import 'package:graduation_project_2/components/background.dart';
import 'package:graduation_project_2/components/custome_text_field.dart';
import 'package:graduation_project_2/components/drawer_layout.dart';
import 'package:time_picker_widget/time_picker_widget.dart';

import '../constants.dart';

class AppointmentScreen extends StatefulWidget {
  static String id = 'Appointment screen';
  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'NOTE!!',
            style: TextStyle(color: Colors.red),
          ),
          content: Text(
              "If you change your status you will delete all your appointments!!"),
          actions: <Widget>[
            FlatButton(
              child: Text("YES"),
              onPressed: () async {
                var result = await invokeAPI(
                  'change_status',
                  {'status': 1, 'user_id': kUser.userID},
                );
                if (result['status_code'] == 200)
                  setState(
                    () {
                      kUser.isActive = false;
                      Navigator.pop(context);
                    },
                  );
              },
            ),
            FlatButton(
              child: Text("CANCEL"),
              onPressed: () {
                //Put your code here which you want to execute on No button click.
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TimeOfDay _fromSelectedHour;
  String _fromDefValue = 'Select Hour';
  TimeOfDay _toSelectedHour;
  String _toDefValue = 'Select Hour';
  String _location;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: DrawerLayout(),
        ),
        body: SingleChildScrollView(
          child: Background(
            mainImage: true,
            top2Image: true,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 15.0,
                  left: 15.0,
                  child: IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                    onPressed: () => _scaffoldKey.currentState.openDrawer(),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 20.0),
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          'Get Hired!',
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Source Sans Pro'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Card(
                      elevation: 15,
                      color: Colors.white,
                      shadowColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      margin: EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          Card(
                            elevation: 15,
                            margin: EdgeInsets.only(
                                bottom: 5, left: 25.0, right: 25.0, top: 20.0),
                            color: Colors.white,
                            shadowColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Status',
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Radio(
                                        value: true,
                                        groupValue: kUser.isActive,
                                        onChanged: (value) {
                                          setState(() {
                                            kUser.isActive = value;
                                          });
                                        }),
                                    Text(
                                      'Available',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Radio(
                                      value: false,
                                      groupValue: kUser.isActive,
                                      onChanged: (value) async {
                                        showAlert(context);
                                      },
                                    ),
                                    Text(
                                      'Not Available',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          Container(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              'Select your availability hours for today!',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          Card(
                            margin: EdgeInsets.only(
                                bottom: 10, left: 20.0, right: 20.0),
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    'From ',
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                ),
                                Container(
                                  child: FlatButton(
                                    onPressed: kUser.isActive
                                        ? () async {
                                            showCustomTimePicker(
                                                context: context,
                                                // It is a must if you provide selectableTimePredicate
                                                onFailValidation: (context) =>
                                                    print(
                                                        'Unavailable selection'),
                                                initialTime: TimeOfDay(
                                                    hour: 9, minute: 0),
                                                selectableTimePredicate:
                                                    (time) =>
                                                        time.hour >= 9 &&
                                                        time.hour < 17 &&
                                                        time.minute % 100 ==
                                                            0).then((time) =>
                                                setState(() =>
                                                    _fromSelectedHour = time));
                                          }
                                        : () {
                                            showAlertDialog(context, 'Status',
                                                'Make sure your status is active');
                                          },
                                    child: Container(
                                        child: Row(
                                      children: [
                                        Text(_fromSelectedHour == null
                                            ? _fromDefValue
                                            : _fromSelectedHour
                                                .format(context)),
                                        Icon(Icons.arrow_drop_down)
                                      ],
                                    )),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    'To',
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                ),
                                Container(
                                  child: FlatButton(
                                    onPressed:
                                        kUser.isActive &&
                                                _fromSelectedHour != null
                                            ? () async {
                                                showCustomTimePicker(
                                                    context: context,
                                                    // It is a must if you provide selectableTimePredicate
                                                    onFailValidation:
                                                        (context) => print(
                                                            'Unavailable selection'),
                                                    initialTime: getTime(
                                                        _fromSelectedHour,
                                                        context),
                                                    selectableTimePredicate: (time) =>
                                                        time.hour >=
                                                            getTime(_fromSelectedHour,
                                                                    context)
                                                                .hour &&
                                                        time.hour < 17 &&
                                                        time.minute % 100 ==
                                                            0).then((time) =>
                                                    setState(() => _toSelectedHour = time));
                                              }
                                            : _fromSelectedHour == null
                                                ? () {
                                                    showAlertDialog(
                                                        context,
                                                        'Picking Error',
                                                        "Make sure to pick when you going to start!");
                                                  }
                                                : () {
                                                    showAlertDialog(
                                                        context,
                                                        'Status',
                                                        'Make sure your status is available');
                                                  },
                                    child: Container(
                                        child: Row(
                                      children: [
                                        Text(_toSelectedHour == null
                                            ? _toDefValue
                                            : _toSelectedHour.format(context)),
                                        Icon(Icons.arrow_drop_down)
                                      ],
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Card(
                            margin: EdgeInsets.only(
                                bottom: 10, left: 30.0, right: 30.0, top: 20.0),
                            color: Colors.white,
                            shadowColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: kTextField(
                              onChanged: (value) {
                                _location = value;
                              },
                              hintText: 'Enter location',
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            padding: EdgeInsets.all(20),
                            alignment: Alignment.center,
                            child: RaisedButton(
                              onPressed: kUser.isActive &&
                                      _fromSelectedHour != null &&
                                      _toSelectedHour != null &&
                                      _location != null
                                  ? () async {
                                      Map<String, dynamic> data = {
                                        "teacher_id": kUser.userID,
                                        "time_from": _fromSelectedHour.hour,
                                        "time_to": _toSelectedHour.hour,
                                        "location": _location
                                      };

                                      dynamic result = await invokeAPI(
                                          'make_schedule', data);

                                      dynamic activeResult = await invokeAPI(
                                        'change_status',
                                        {'status': 2, 'user_id': kUser.userID},
                                      );

                                      if (result['status_code'] == 200 &&
                                          activeResult['status_code'] == 200) {
                                        showAlertDialog(context, 'Success!',
                                            'Wait students to hire you!');
                                      } else
                                        showAlertDialog(context, 'Error!',
                                            'Something went wrong!');
                                    }
                                  : _toSelectedHour == null ||
                                          _fromSelectedHour == null ||
                                          _location == null
                                      ? () {
                                          showAlertDialog(context, 'Error Data',
                                              'Select your availability hours!');
                                        }
                                      : _location == null
                                          ? () {
                                              showAlertDialog(
                                                  context,
                                                  'Error Data',
                                                  'Enter your location');
                                            }
                                          : () {
                                              showAlertDialog(
                                                  context,
                                                  'Change Status',
                                                  'Make sure your status is active');
                                            },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(80.0)),
                              textColor: Colors.white,
                              padding: const EdgeInsets.all(0),
                              child: Container(
                                alignment: Alignment.center,
                                height: 50.0,
                                width: size.width * 0.3,
                                decoration: new BoxDecoration(
                                  borderRadius: BorderRadius.circular(80.0),
                                  gradient: new LinearGradient(
                                    colors: [
                                      Colors.white,
                                      Colors.blue,
                                    ],
                                  ),
                                ),
                                padding: const EdgeInsets.all(0),
                                child: Text(
                                  "START",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
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
