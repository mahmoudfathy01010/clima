import 'dart:convert';

import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/network.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {



 getLocationAndData() async {
  var weatherData;
  WeatherModel weatherModel = WeatherModel();
  weatherData= await weatherModel.getLocationAndData();
  Navigator.push(context, MaterialPageRoute(builder:(context)=>LocationScreen(weatherDetails: weatherData,)));
}


  @override
  void initState() {
    super.initState();
    getLocationAndData();
  }

  @override
  Widget build(BuildContext context) {
    double a = 10;
    print("Iam in build");
    return Scaffold(
      body: Center(
        child:SpinKitDoubleBounce(
        color: Colors.white,
        size: 100.0,
      ),
      ),

    );
  }

  @override
  void deactivate() {
    super.deactivate();
    print("Iam in deactivate");
  }
}
