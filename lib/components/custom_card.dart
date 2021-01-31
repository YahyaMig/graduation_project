import 'package:flutter/material.dart';
import 'drawer_items.dart';

class CustomCard extends StatelessWidget {
  final Function onTap;
  final String text;
  final IconData icon;
  final Widget child;
  final double elevation;
  final Color shadowColor;
  final Color color;
  final double borderRadius;

  const CustomCard({
    this.onTap,
    this.text,
    this.icon,
    this.child,
    this.color = Colors.white,
    this.shadowColor = Colors.white,
    this.elevation = 25,
    this.borderRadius = 15.0,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      elevation: this.elevation,
      color: this.color,
      shadowColor: this.shadowColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(this.borderRadius),
      ),
      child: child != null
          ? this.child
          : DrawerListItem(icon: this.icon, text: this.text, onTap: this.onTap),
    );
  }
}
