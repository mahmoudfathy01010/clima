import 'package:geolocator/geolocator.dart';
class Location{
  double longtitude;
  double latitude;

  getLocation() async {
    try {
      Position position = await Geolocator().getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      longtitude = position.longitude;
      latitude = position.latitude;
    }
    catch(e){
      print("error: $e");
    }
  }


}