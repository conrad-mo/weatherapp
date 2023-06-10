import 'package:flutter/material.dart';

class WeatherMainContainer extends StatefulWidget {
  const WeatherMainContainer({super.key});

  @override
  State<WeatherMainContainer> createState() => _WeatherMainContainerState();
}

class _WeatherMainContainerState extends State<WeatherMainContainer> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Row(
        children: <Widget>[
          Container(
            child: Text('pog'),
          )
        ],
      ),
    );
  }
}
