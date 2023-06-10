import 'package:flutter/material.dart';
import 'components/weatherlabel.dart' as wlabel;

class WeatherHome extends StatefulWidget {
  const WeatherHome({super.key});

  @override
  State<WeatherHome> createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        //margin: EdgeInsets.all(24),
        child: const SafeArea(
          //safearea protects app from notch
          child: wlabel.WeatherLabel(),
        ),
      ),
    );
  }
}
