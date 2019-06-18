import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  final IconData iconData;
  final String text;
  IconContent({@required this.iconData, @required this.text});
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(iconData, size: 80.0),
        SizedBox(height: 15),
        Text(text, style: TextStyle(fontSize: 18.0),),
      ],
    );
  }
}