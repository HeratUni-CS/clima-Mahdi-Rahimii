import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

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
    try{
    Position position =
        GeoLocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print(position);
  }
  catch(e){
    print(e);
  }
  }
  @override
  Widget build(BuildContext context) {
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
