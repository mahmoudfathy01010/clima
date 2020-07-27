
import 'package:geolocator/geolocator.dart';
class Location{
  double longtitude;
  double latitude;

  getLocation() async {
    try {
      print("getLocation b");
      if(await Geolocator().isLocationServiceEnabled()) {
        Position position = await Geolocator().getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best);
        print("getLocation a");

        longtitude = position.longitude;
        latitude = position.latitude;
      }

      print("el3ab B3ed");
    }
    catch(e){
      print("error: $e");
    }
  }


}