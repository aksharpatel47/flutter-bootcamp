import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final String text;
  final void Function() onTap;
  BottomBar({@required this.text, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 16.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: Center(
            child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
