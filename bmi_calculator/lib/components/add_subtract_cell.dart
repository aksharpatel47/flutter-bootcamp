import 'package:bmi_calculator/components/unit_component.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddSubCell extends StatelessWidget {
  final String heading;
  final int value;
  final String unit;
  final void Function() onAdd;
  final void Function() onSub;

  AddSubCell(
      {@required this.heading,
      @required this.value,
      @required this.onAdd,
      @required this.onSub,
      @required this.unit});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(heading),
        UnitComponent(
          value: value,
          unit: unit,
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onPressed: onSub,
            ),
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onPressed: onAdd,
            ),
          ],
        ),
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final void Function() onPressed;

  RoundIconButton({@required this.icon, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 6.0,
      child: Icon(icon),
      shape: CircleBorder(),
      fillColor: Color(0xff31334a),
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
    );
  }
}
