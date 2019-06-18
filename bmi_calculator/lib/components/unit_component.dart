import 'package:flutter/material.dart';

class UnitComponent extends StatelessWidget {
  final int value;
  final String unit;
  UnitComponent({@required this.value, @required this.unit});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      textBaseline: TextBaseline.alphabetic,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      children: <Widget>[
        Text(
          value.toString(),
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 48,
          ),
        ),
        Text(unit),
      ],
    );
  }
}
