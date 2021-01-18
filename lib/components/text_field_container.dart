import 'package:flutter/material.dart';

import '../constants.dart';

class TextFieldContainer extends StatelessWidget {

  final String hintText;
  final Function onChanged;

  TextFieldContainer({@required this.hintText, @required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        textAlign: TextAlign.center,
        decoration:
        kTextFieldDecoration.copyWith(hintText: this.hintText),
        onChanged: onChanged,
      ),
    );
  }
}