import 'package:flutter/material.dart';
import 'components/weathercardbar.dart' as wcardbar;
import 'components/weathermain.dart' as wmaincontainer;

class WeatherHome extends StatefulWidget {
  const WeatherHome({super.key});

  @override
  State<WeatherHome> createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        alignment: Alignment.topCenter,
        //margin: EdgeInsets.all(24),
        child: const SafeArea(
          //safearea protects app from notch
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              wmaincontainer.WeatherMainContainer(),
              wcardbar.WeatherLabel()
            ],
          ),
        ),
      ),
    );
  }
}
