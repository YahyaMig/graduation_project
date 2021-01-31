import 'package:flutter/material.dart';

// ignore: camel_case_types
class kTextField extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final Function onChanged;
  final bool isNumber;
  kTextField(
      {@required this.hintText, this.isPassword = false, this.onChanged, this.isNumber = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        onChanged: this.onChanged,
        decoration: InputDecoration(
          labelText: this.hintText,
          labelStyle: TextStyle(
            fontFamily: 'Source Sans Pro',
          ),
        ),
        obscureText: this.isPassword,
      ),
    );
  }
}
