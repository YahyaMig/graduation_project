import 'package:flutter/material.dart';

import '../constants.dart';

class TextFieldContainer extends StatelessWidget {

  final String hintText;
  final Function onChanged;
  final bool isNumber;

  TextFieldContainer({@required this.hintText, @required this.onChanged, this.isNumber = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      child: TextField(
        keyboardType: isNumber? TextInputType.emailAddress : TextInputType.number,
        textAlign: TextAlign.center,
        decoration:
        kTextFieldDecoration.copyWith(hintText: this.hintText),
        onChanged: onChanged,
      ),
    );
  }
}