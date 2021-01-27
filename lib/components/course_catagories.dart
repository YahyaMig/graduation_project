import 'package:flutter/material.dart';

class Course extends StatelessWidget {
  final String imageUrl;
  final Function onPressed;

  Course({@required this.imageUrl, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: this.onPressed,
      child: Container(
        child: Container(
          padding: EdgeInsets.all(10.0),
          height: 150,
          width: 150,
          child: Image(
            image: NetworkImage(this.imageUrl),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
