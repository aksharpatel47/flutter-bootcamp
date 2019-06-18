import 'package:bmi_calculator/components/unit_component.dart';
import 'package:flutter/material.dart';

class HeightCell extends StatelessWidget {
  final int height;
  final void Function(int) onChanged;

  HeightCell({@required this.height, @required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("HEIGHT"),
        UnitComponent(
          value: height,
          unit: "cm"
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
              thumbColor: Color(0xFFea1356),
              overlayColor: Color(0x29ea1356),
              activeTrackColor: Colors.white,
              thumbShape: RoundSliderThumbShape(
                enabledThumbRadius: 16,
              ),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 32)),
          child: Slider(
            value: height.toDouble(),
            min: 120,
            max: 220,
            onChanged: (newValue) {
              onChanged(newValue.round());
            },
            inactiveColor: Colors.grey,
          ),
        )
      ],
    );
  }
}
