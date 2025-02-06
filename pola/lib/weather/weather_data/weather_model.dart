// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:intl/intl.dart';

class DailyForecast {
  var date;
  var temp_max;
  var temp_min;
  var icon;
  var condition;

  DailyForecast({
    required this.date,
    required this.temp_max,
    required this.temp_min,
    required this.icon,
    required this.condition,
  });

  // Constructor to parse JSON data for each day
  DailyForecast.fromJson(Map<String, dynamic> json)
      : date = json['date'],
        temp_max = json['day']['maxtemp_c'],
        temp_min = json['day']['mintemp_c'],
        icon = json['day']['condition']['icon'],
        condition = json['day']['condition']['text'];
}

class Weather {
  var cityName;
  var icon;
  var condition;
  var temp;
  var wind;
  var humidity;
  var wind_dir;
  var last_update;
  var time;  
  List<DailyForecast> dailyForecast = [];

  Weather({
    required this.cityName,
    required this.icon,
    required this.condition,
    required this.temp,
    required this.wind,
    required this.humidity,
    required this.wind_dir,
    required this.last_update,
    required this.time,
    required this.dailyForecast, // Include daily forecast in constructor
  });

  // Parse daily forecast data
  Weather.fromJson(Map<String, dynamic> json)
      : cityName = json['location']['name'],
        icon = json['current']['condition']['icon'],
        condition = json['current']['condition']['text'],
        temp = json['current']['temp_c'],
        wind = json['current']['wind_kph'],
        humidity = json['current']['humidity'],
        wind_dir = json['current']['wind_dir'],
        last_update = json['current']['last_updated'],
        time = _formatTime(json['location']['localtime']),
        dailyForecast = (json['forecast']['forecast'] as List)
            .map((day) => DailyForecast.fromJson(day))
            .toList(); 
  // Method to convert and format time
  static String _formatTime(String localtime) {
    DateTime dateTime = DateFormat("yyyy-MM-dd HH:mm").parse(localtime);
    return DateFormat("h:mm a").format(dateTime);
  }
}
