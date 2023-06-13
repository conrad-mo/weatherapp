library globals;

import 'main.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final locationlist = <String>[];
final countrylist = <String>[];
String currentlocation = locationlist[0];
String currentcountry = countrylist[0];
int currentIndex = 0;

void fetchWeather(WidgetRef ref) async {
  final httpPackageUrl = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$currentlocation,$currentcountry&appid=ad20e8aa2db0541f16334d6fa175cc03');
  http.Response response = await http.get(httpPackageUrl);
  if (response.statusCode == 404) {
    ref.read(fourofourProvider.notifier).state = true;
  } else {
    final httpPackageInfo = await http.read(httpPackageUrl);
    final httpPackageJson =
        json.decode(httpPackageInfo) as Map<String, dynamic>;
    if (!httpPackageJson.containsKey("message") || response.statusCode != 404) {
      ref.read(fourofourProvider.notifier).state = false;
      ref.read(weathertempProvider.notifier).state =
          (httpPackageJson["main"]["temp"] - 273.15).round();
      ref.read(feelslikeProvider.notifier).state =
          (httpPackageJson["main"]["feels_like"] - 273.15).round();
      ref.read(windspeedProvider.notifier).state =
          (httpPackageJson["wind"]["speed"] * 3.6).round();
      ref.read(descriptionProvider.notifier).state =
          (httpPackageJson["weather"][0]["description"]);
      if (httpPackageJson["weather"][0]["description"].contains("sun")) {
        ref.read(iconindexProvider.notifier).state = 0;
      } else if (httpPackageJson["weather"][0]["description"]
              .contains("cloud") ||
          httpPackageJson["weather"][0]["description"].contains("clear")) {
        ref.read(iconindexProvider.notifier).state = 1;
      } else if (["rain", "drizzle", "thunder", "storm", "mist"]
          .any(httpPackageJson["weather"][0]["description"].contains)) {
        ref.read(iconindexProvider.notifier).state = 2;
      } else if (httpPackageJson["weather"][0]["description"]
          .contains("snow")) {
        ref.read(iconindexProvider.notifier).state = 3;
      }
      if (httpPackageJson.containsKey("rain")) {
        ref.read(rainProvider.notifier).state =
            (httpPackageJson["rain"]["1h"]).round();
      } else {
        ref.read(rainProvider.notifier).state = 0;
      }
    } else {
      ref.read(fourofourProvider.notifier).state = true;
    }
  }
}
