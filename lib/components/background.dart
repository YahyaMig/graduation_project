import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  final bool top1Image;
  final bool top2Image;
  final bool mainImage;
  final bool bottom1Image;
  final bool bottom2Image;

  const Background(
      {Key key,
      @required this.child,
      this.top1Image = false,
      this.top2Image = false,
      this.mainImage = false,
      this.bottom1Image = false,
      this.bottom2Image = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          !this.top1Image
              ? Positioned(
                  top: 0,
                  right: 0,
                  child:
                      Image.asset("assets/images/top1.png", width: size.width),
                )
              : SizedBox.shrink(),
          !this.top2Image
              ? Positioned(
                  top: 0,
                  right: 0,
                  child:
                      Image.asset("assets/images/top2.png", width: size.width),
                )
              : SizedBox.shrink(),
          !this.mainImage
              ? Positioned(
                  top: 50,
                  right: 30,
                  child: Image.asset("assets/images/main.png",
                      width: size.width * 0.35),
                )
              : SizedBox.shrink(),
          !this.bottom1Image
              ? Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset("assets/images/bottom1.png",
                      width: size.width),
                )
              : SizedBox.shrink(),
          !this.bottom2Image
              ? Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset("assets/images/bottom2.png",
                      width: size.width),
                )
              : SizedBox.shrink(),
          child
        ],
      ),
    );
  }
}
