import 'package:clima/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/city.jpg"),
                    fit: BoxFit.fitHeight)),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    decoration: kInputFieldDecoratiob,
                    style: TextStyle(color: Colors.black),
                    onChanged:(data){
                      cityName=data;
                    } ,
                  ),
                ),
                FlatButton(
                  onPressed: (){
                    Navigator.pop(context,cityName);
                  },
                    child: Text(
                  "Get Weather",
                  style: kGetWeatherButtonStyle,
                ))
              ],
            )),
      ),
    );
  }
}
