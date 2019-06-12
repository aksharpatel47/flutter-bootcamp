import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "I Am Dev",
      theme: ThemeData(
        primaryColor: Colors.indigo,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("I Am Dev"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Image(image: AssetImage('images/dev.png')),
          ),
        ),
        backgroundColor: Colors.indigo[100],
      ),
    );
  }
}
