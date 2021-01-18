import 'package:flutter/material.dart';

class DrawerListItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function onTap;

  DrawerListItem({@required this.text, @required this.icon, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: this.onTap,
      title: Row(
        children: <Widget>[
          Icon(
            this.icon,
            color: Colors.black,
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(this.text),
        ],
      ),
    );
  }
}