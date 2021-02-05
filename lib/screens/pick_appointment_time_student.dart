import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:graduation_project_2/components/alert_dialog.dart';
import 'package:graduation_project_2/components/background.dart';
import 'package:time_picker_widget/time_picker_widget.dart';

import '../constants.dart';

class PickAppointmentTime extends StatefulWidget {
  static String id = 'pick appointment time';
  @override
  _PickAppointmentTimeState createState() => _PickAppointmentTimeState();
}

class _PickAppointmentTimeState extends State<PickAppointmentTime> {
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
        appBar: AppBar(
          title: Text('Teachers for this course'),
        ),
        body: SingleChildScrollView(
          child: Background(
            mainImage: true,
            top2Image: true,
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 20.0),
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          'Pick your appointment',
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
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          Container(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              'Select appointment time',
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
                                    onPressed: () async {
                                      print(selectedTimeFrom);
                                      print(selectedTimeTo);
                                      showCustomTimePicker(
                                          context: context,
                                          // It is a must if you provide selectableTimePredicate
                                          onFailValidation: (context) =>
                                              print('Unavailable selection'),
                                          initialTime: TimeOfDay(
                                              hour: selectedTimeFrom,
                                              minute: 0),
                                          selectableTimePredicate: (time) =>
                                              time.hour >= selectedTimeFrom &&
                                              time.hour < selectedTimeTo &&
                                              time.minute % 100 == 0).then(
                                          (time) => setState(
                                              () => _fromSelectedHour = time));
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
                                    onPressed: _fromSelectedHour != null
                                        ? () async {
                                            showCustomTimePicker(
                                                context: context,
                                                // It is a must if you provide selectableTimePredicate
                                                onFailValidation: (context) =>
                                                    print(
                                                        'Unavailable selection'),
                                                initialTime: TimeOfDay(
                                                    hour: selectedTimeTo,
                                                    minute: 0),
                                                selectableTimePredicate:
                                                    (time) =>
                                                        time.hour >
                                                            _fromSelectedHour
                                                                .hour &&
                                                        time.hour <=
                                                            selectedTimeTo &&
                                                        time.minute % 100 ==
                                                            0).then((time) =>
                                                setState(() =>
                                                    _toSelectedHour = time));
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
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            padding: EdgeInsets.all(20),
                            alignment: Alignment.center,
                            child: RaisedButton(
                              onPressed: _fromSelectedHour != null &&
                                      _toSelectedHour != null
                                  ? () async {
                                      print(selectedLocation);
                                      Map<String, dynamic> data = {
                                        "teacher_id": teacherID,
                                        "student_id": kUser.userID,
                                        "time_from": _fromSelectedHour.hour,
                                        "time_to": _toSelectedHour.hour,
                                        "location": selectedLocation
                                      };

                                      dynamic result = await invokeAPI(
                                          'make_appointment', data);
                                      print(result);

                                      if (result['status_code'] == 200) {
                                        if (result['Result'] == "meeting exists"){
                                          showAlertDialog(context, 'Error',
                                              'You already have a meeting at this time!');
                                        }
                                        else
                                          showAlertDialog(context, 'Success!',
                                              'Done! please contact the teacher to meet up!');
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
