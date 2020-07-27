import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  final weatherDetails;

  const LocationScreen({Key key, this.weatherDetails}) : super(key: key);
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {


  int temp;
  String cityName;
  int condition;
  WeatherModel weatherModel = WeatherModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData(widget.weatherDetails);
    print("initStaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaate");

  }

  @override
  Widget build(BuildContext context) {
    print(widget.weatherDetails);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/Natural_Background.jpg"),
                  fit: BoxFit.fitHeight)),

            child: SafeArea(
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlatButton(
                          onPressed: () async {
                            getData(await weatherModel.getLocationAndData());
                          },
                            child: Icon(
                          Icons.near_me,
                          size: 50,
                          color: Colors.white,
                        )),
                        FlatButton(
                          onPressed: () async{
                           var userCityName= await Navigator.push(context, MaterialPageRoute(builder: (context)=>CityScreen()));
                           if(userCityName!=null) {
                             getData(await weatherModel.getCityWeather(
                                 userCityName));
                           }
                          },
                            child: Icon(
                          Icons.location_city,
                          size: 50,
                          color: Colors.white,
                        ))
                      ],
                    ),
                    Text(
                        "${temp==5000? "Error":temp.toString()+"°"}${temp == 5000? "":WeatherModel().getWeatherIcon(condition)}",
                        style: kTempTextStyle),
                    Text(
                      WeatherModel().getMessage(temp)+"${temp==5000? "":" in $cityName"}",
                      style: temp == 5000?kMessageTextStyleInProblem: kMessageTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

      ),
      ),
    );
  }

  getData(dynamic weatherData) {
    setState(() {
      if(weatherData==null){
        temp =5000;
        cityName='';
        condition=-1;
        return;
      }
      var t = weatherData['main']['temp'];
      temp = t.toInt();
      condition = weatherData["weather"][0]["id"];
      cityName = weatherData['name'];
    });
  }


}
