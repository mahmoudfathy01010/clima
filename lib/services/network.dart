import 'dart:convert';
import 'dart:io';

import 'package:clima/utils/constants.dart';
import 'package:http/http.dart' as http;

class NetworkAPI {
  var _data;
  var _city;
  var _weatherDescription;
  var _temp;
  final String url;

  NetworkAPI(this.url);

  Future getData() async {
    print("network able");
    http.Response response;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        response = await http.get(url);
        if (response.statusCode == 200) {
          _data = jsonDecode(response.body);
          _city = _data['name'];
          _weatherDescription = _data["weather"][0]["id"];
          _temp = _data['main']['temp'];

          print(_city);
          print(_weatherDescription);
          print(_temp - 273.15);
          return _data;
        } else {
        }
      }
    } on SocketException catch (_) {
    }

  }

  get temp => _temp;

  get weatherDescription => _weatherDescription;

  get city => _city;
}
