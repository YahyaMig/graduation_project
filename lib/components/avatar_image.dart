import 'package:flutter/material.dart';

class AvatarPicture extends StatelessWidget {
  final String imagePath;
  final double borderWidth;

  AvatarPicture({this.imagePath, this.borderWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      height: 95,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(
          width: this.borderWidth,
          color: Colors.lightBlueAccent,
        ),
        shape: BoxShape.circle,
        image: DecorationImage(
            image: AssetImage(this.imagePath), fit: BoxFit.fill),
      ),
    );
  }
}
