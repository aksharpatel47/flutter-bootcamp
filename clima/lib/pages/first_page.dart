import 'package:clima/main.dart';
import 'package:clima/models/weather_model.dart';
import 'package:clima/pages/location_select_page.dart';
import 'package:clima/services/weather_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  Future<void> getWeather() async {
    try {
      final currentLocation = await location.getLocation();
      print(currentLocation.latitude);
      print(currentLocation.longitude);
      final result = await getWeatherFromCoordinate(
        lat: currentLocation.latitude,
        lon: currentLocation.longitude,
      );
      print(result.toJson());
      print(result.weather[0].toJson());

      setState(() {
        response = result;
      });
    } catch (e) {
      print(e);
    }
  }

  WeatherResponse response;

  @override
  initState() {
    super.initState();
    getWeather();
  }

  Widget renderSpinnder() {
    return Center(
      child: SpinKitFadingGrid(
        color: Colors.black,
        size: 50.0,
      ),
    );
  }

  Widget renderWeather() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            response.main.temp.toInt().toString() + "°",
            style: TextStyle(fontSize: 54),
          ),
          Text(
            response.name,
            style: TextStyle(fontSize: 32),
          ),
          Image(
            image: NetworkImage(
                "https://openweathermap.org/img/w/${response.weather[0].icon}.png"),
          ),
          Text(
            response.weather[0].description,
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () async {
              final String cityName = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return LocationSelectPage();
              }));

              if (cityName != null) {
                final cityResponse =
                    await getWeatherFromCity(cityName: cityName);
                setState(() {
                  response = cityResponse;
                });
              }
            },
          ),
        ],
      ),
      body: response == null ? renderSpinnder() : renderWeather(),
    );
  }
}
