library globals;

import 'dart:convert';

import 'package:http/http.dart' as http;

final locationlist = <String>["Markham", "Scarborough"];
final countrylist = <String>["CA", "CA"];
String currentlocation = locationlist[0];
String currentcountry = countrylist[0];
int currentIndex = 0;
int weathertemp = 0;
int feelslike = 0;
int windspeed = 0;
String description = "";
int humidity = 0;
String country = "";
int rain = 0;

void fetchWeather() async {
  final httpPackageUrl = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$currentlocation,$currentcountry&appid=ad20e8aa2db0541f16334d6fa175cc03');
  final httpPackageInfo = await http.read(httpPackageUrl);
  final httpPackageJson = json.decode(httpPackageInfo) as Map<String, dynamic>;
  weathertemp = (httpPackageJson["main"]["temp"] - 273.15).round();
  feelslike = (httpPackageJson["main"]["feels_like"] - 273.15).round();
  windspeed = (httpPackageJson["wind"]["speed"] * 3.6).round();
  description = (httpPackageJson["weather"][0]["description"]);
  humidity = (httpPackageJson["main"]["humidity"]);
  country = httpPackageJson["sys"]["country"];
  if (httpPackageJson.containsKey("rain")) {
    rain = (httpPackageJson["rain"]["1h"]).round();
  }
}
