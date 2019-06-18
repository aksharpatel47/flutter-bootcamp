import 'package:bmi_calculator/bmi_calculator.dart';
import 'package:bmi_calculator/components/add_subtract_cell.dart';
import 'package:bmi_calculator/components/bottom_bar.dart';
import 'package:bmi_calculator/components/height_cell.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/pages/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender;
  int height = 180;
  int weight = 75;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(children: <Widget>[
              Expanded(
                child: ReusableCard(
                  color: gender == Gender.MALE ? kActiveCardColor : null,
                  child: IconContent(
                    iconData: FontAwesomeIcons.mars,
                    text: "MALE",
                  ),
                  onTap: () {
                    setState(() {
                      gender = Gender.MALE;
                    });
                  },
                ),
              ),
              Expanded(
                child: ReusableCard(
                  color: gender == Gender.FEMALE ? kActiveCardColor : null,
                  child: IconContent(
                    iconData: FontAwesomeIcons.venus,
                    text: "FEMALE",
                  ),
                  onTap: () {
                    setState(() {
                      gender = Gender.FEMALE;
                    });
                  },
                ),
              ),
            ]),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              child: HeightCell(
                height: height,
                onChanged: (newHeight) {
                  setState(() {
                    height = newHeight;
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    child: AddSubCell(
                      heading: "WEIGHT",
                      unit: "kg",
                      value: weight,
                      onAdd: () {
                        setState(() {
                          weight += 1;
                        });
                      },
                      onSub: () {
                        setState(() {
                          weight -= 1;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    child: AddSubCell(
                      heading: "AGE",
                      unit: "yrs",
                      value: age,
                      onAdd: () {
                        setState(() {
                          age += 1;
                        });
                      },
                      onSub: () {
                        setState(() {
                          age -= 1;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomBar(
            text: "CALCULATE YOUR BMI",
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResultPage(
                  bmi: BMICalc(
                    height: height,
                    weight: weight,
                  ),
                );
              }));
            },
          ),
        ],
      ),
    );
  }
}
