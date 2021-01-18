import 'package:flutter/material.dart';
class StudentJobInfo extends StatelessWidget {
  final IconData icon;
  final Color textColor;
  final String text;
  final Color iconColor;
  final bool sizedbox;

  StudentJobInfo(
      {this.icon, this.iconColor, this.text, this.textColor, this.sizedbox});

  SizedBox sizedBox() {
    if (this.sizedbox == true) {
      return SizedBox(width: 20);
    }
    return SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        sizedBox(),
        Padding(
          padding: EdgeInsets.only(right: 5),
          child: Icon(
            this.icon,
            color: this.iconColor,
          ),
        ),
        Text(
          this.text,
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}