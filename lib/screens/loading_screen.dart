import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState{
    super.initState();
    getLocation();
  }
  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }
  void getData() async{
    http.Response response = await http.get('https://samples.openweathermap.org/data/2.5/weather?lat35&lon=139&appid=b6907d289e10d714a6e88b30761fae22');
    if(response.status == 200){
      String data = response.body;

      var decodedData = jsonDecode(data);
      double temperature =decodedData['main']['temp'];
      int condition =decodedData['weather'][0]['id'];
      String cityName =decodedData['name'];
    }else{
      print(response.StatusCode);
    }
  }
  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
