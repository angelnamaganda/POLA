// ignore_for_file: unused_local_variable
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pola/weather/weather_data/weather_model.dart';

/*class WeatherData{

  Future<Weather> getData(var latitude, var longitude) async {
    var uriCall = Uri.parse('http://api.weatherapi.com/v1/current.json?key=bf63ce1b5f764197b24223904232408&q=$latitude,$longi&aqi=no');
    var response = await http.get(uriCall);
    var body = jsonDecode(response.body);
    return Weather.fromJson(body);
  }
}*/

class WeatherData{

 
  Future<Weather> getData(var lat, var long) async {
    var uriCall = Uri.parse('http://api.weatherapi.com/v1/current.json?key=bf63ce1b5f764197b24223904232408&q=$lat,$long&aqi=no');
    var response = await http.get(uriCall);
    var body = jsonDecode(response.body);
    return Weather.fromJson(body);
  }
}