import 'package:flutter/material.dart';

import 'constants.dart';

class MyHeader extends StatefulWidget {
  final String imagee;
  final String text;
  final double Height;

  const MyHeader({Key key, this.imagee, this.text, this.Height})
      : super(key: key);

  @override
  _MyHeaderState createState() => _MyHeaderState();
}

class _MyHeaderState extends State<MyHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 40, top: 50, right: 20),
      height: widget.Height,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage(
            widget.imagee,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          SizedBox(height: 30),
          Expanded(
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 70,
                  left: 200,
                  child: Text(
                    '${widget.text}',
                    style: kSendButtonTextStyle.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
