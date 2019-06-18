import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget child;
  final void Function() onTap;

  ReusableCard({
    this.color: kInactiveCardColor,
    this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color,
        ),
        child: child,
      ),
    );
  }
}
