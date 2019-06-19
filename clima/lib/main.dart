import 'package:clima/pages/first_page.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

void main() => runApp(MyApp());
var location = Location();

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CLIMA",
      home: FirstPage(),
    );
  }
}
