import 'package:flutter/material.dart';
import 'globalvars.dart' as globals;

class WeatherHome extends StatefulWidget {
  const WeatherHome({super.key});

  @override
  State<WeatherHome> createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SafeArea(child: Text('Weather: ${globals.currentlocation}'))
          //child: Text('Weather:'),
          ),
    );
  }
}
