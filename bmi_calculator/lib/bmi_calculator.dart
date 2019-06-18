import 'dart:math';

class BMICalc {
  final int height;
  final int weight;

  double _bmi;

  BMICalc({this.weight, this.height}) {
    _bmi = weight.toDouble() / pow(height/100, 2);
  }

  String get bmi => _bmi.toStringAsPrecision(3);
  String get status {
    if (_bmi >= 25) {
      return "Overweight";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String get message {
    if (_bmi >= 25) {
      return "You have a higher than normal body weight. Try to exercise more.";
    } else if (_bmi > 18.5) {
      return "You have a normal body weight. Great Job!";
    } else {
      return "You have a lower than normal body weight. You can eat a bit more.";
    }
  }
}