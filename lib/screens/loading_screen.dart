import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:clima/services/location.dart';
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getCurrentLocation();
    getData();
  }

  Future<void> getCurrentLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    // print(location.latitude);
    // print(location.longitude);
  }

  void getData() async {
    http.Response response = await http.get(
        'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=439d4b804bc8187953eb36d2a8c26a02');
    // print(response.body);
    // print(response.statusCode);

    if (response.statusCode == 200) {
      String data = response.body;

      var temp = jsonDecode(data)['main']['temp'];
      print(temp);

      var weatherDescription = jsonDecode(data)['weather'][0]['description'];
      print(weatherDescription);

      var mainID = jsonDecode(data)['weather'][0]['id'];
      print(mainID);

      var cityName = jsonDecode(data)['name'];
      print(cityName);

      // temp id city name
    } else {
      // print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // getCurrentLocation();
            //Get the current location
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
