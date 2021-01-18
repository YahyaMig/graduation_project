import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_2/components/drawer_layout.dart';
import 'package:graduation_project_2/components/reusableCard.dart';
import 'package:graduation_project_2/components/student_job_info.dart';

import '../constants.dart';

class TeacherJobScreen extends StatelessWidget {
  static String id = 'teacher_job_screen';
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: DrawerLayout(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Jobs',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 20),
                    height: 100.0,
                    width: 400,
                    child: ReusableCard(
                      colour: Colors.white,
                      cardChild: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Image.asset('images/avatar1.jpg')),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Yahya migdady',
                                style: kTextCardStyle,
                              ),
                              StudentJobInfo(
                                textColor: Colors.grey,
                                icon: Icons.email_outlined,
                                text: 'Yahya@email.com',
                                iconColor: Colors.lightBlueAccent,
                              ),
                              StudentJobInfo(
                                iconColor: Colors.lightBlueAccent,
                                textColor: Colors.grey,
                                icon: Icons.add_location,
                                text: 'amman, jordan, at just',
                                sizedbox: true,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 20),
                    height: 100.0,
                    width: 400,
                    child: ReusableCard(
                      colour: Colors.white,
                      cardChild: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Image.asset('images/avatar1.jpg'),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Yahya migdady',
                                style: kTextCardStyle,
                              ),
                              StudentJobInfo(
                                textColor: Colors.grey,
                                icon: Icons.email_outlined,
                                text: 'Yahya@email.com',
                                iconColor: Colors.lightBlueAccent,
                              ),
                              StudentJobInfo(
                                iconColor: Colors.lightBlueAccent,
                                textColor: Colors.grey,
                                icon: Icons.add_location,
                                text: 'amman, jordan, at just',
                                sizedbox: true,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
