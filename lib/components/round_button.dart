import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String textValue;
  final Function onPressed;
  final Color color;

  RoundButton(
      {@required this.textValue,
      @required this.onPressed,
      @required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: this.color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: this.onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                this.textValue,
                style: TextStyle(color: Colors.white),
              ),
              Icon(Icons.arrow_right,
              color: Colors.white),


            ],
          ),
        ),
      ),
    );
  }
}
