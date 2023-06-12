import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;
  void getCurrentLocaion() async {
    try {
      Position position = GeoLocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
