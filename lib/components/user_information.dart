import 'package:flutter/material.dart';

class UserInformation extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  final String textName;

  UserInformation(
      {this.icon, this.color, @required this.text, @required this.textName});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Icon(
              Icons.circle,
              color: Colors.deepPurple,
              size: 10.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(this.textName),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              this.text,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
