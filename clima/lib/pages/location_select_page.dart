import 'package:flutter/material.dart';

class LocationSelectPage extends StatefulWidget {
  @override
  _LocationSelectPageState createState() => _LocationSelectPageState();
}

class _LocationSelectPageState extends State<LocationSelectPage> {
  String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Location"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "Enter a city name here...",
                ),
                onChanged: (text) {
                  cityName = text;
                },
              ),
              SizedBox(
                height: 16,
              ),
              RaisedButton(
                child: Text("Select"),
                color: Colors.blue,
                onPressed: () {
                  Navigator.pop(
                    context,
                    cityName,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
