import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double longtitude;
  double latitude;

    void getLocation() async{
    Location location = Location();
    await location.getLocation();
    setState(() {
      longtitude = location.longtitude;
      latitude = location.latitude;
    });
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }


  @override
  Widget build(BuildContext context) {
     double a=10;
    print("Iam in build");
    return Scaffold(
        body: Text("long: ${longtitude}  lat: ${latitude}"),
    );
  }
  @override
  void deactivate() {
    super.deactivate();
    print("Iam in deactivate");
  }
}
