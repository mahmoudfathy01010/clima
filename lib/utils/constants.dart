import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const KApiKey = 'aa39cd490f14f9ba4075e5a10de28787';
const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
  color: Colors.white,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);
const kMessageTextStyleInProblem = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 40.0,
);

const kInputFieldDecoratiob = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
    borderSide: BorderSide.none,
  ),
  hintText: 'Enter a city name',
  hintStyle: TextStyle(color: Colors.grey),
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.blueGrey,
  ),
);

const kGetWeatherButtonStyle = TextStyle(color: Colors.black,fontSize: 30, fontFamily: 'Spartan MB' );
