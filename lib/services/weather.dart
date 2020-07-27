import 'package:clima/utils/constants.dart';

import 'location.dart';
import 'network.dart';

const String URL = "https://api.openweathermap.org/data/2.5/weather?";

class WeatherModel {

  Future getCityWeather(String city) async{
    NetworkAPI networkAPI = NetworkAPI(
        "${URL}q=$city&appid=$KApiKey&units=metric");
    print("${URL}q=$city");
        var weatherData = await networkAPI.getData();
        return weatherData;
  }

  Future getLocationAndData() async {
    Location location = Location();
    await location.getLocation();

    NetworkAPI networkAPI = NetworkAPI(
        "${URL}lat=${location.latitude}&lon=${location.longtitude}&appid=$KApiKey&units=metric");
    var weatherData = await networkAPI.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {

     if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    }   else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if(temp==5000){
      return "Unable to get weather Data, please check the internet, the location or the city";}
    else if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    }


    else {
      return 'Bring a 🧥 just in case';
    }
  }
}
