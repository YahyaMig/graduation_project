import 'package:flutter/material.dart';

class MyLogo extends StatefulWidget {
  @override
  _MyLogoState createState() => _MyLogoState();
}

class _MyLogoState extends State<MyLogo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Hero(
        tag: 'logo_img',
        child: Container(
          height: 200.0,
          child: Image.asset('images/logo_img.jpg'),
        ),
      ),
    );
  }
}

