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
        child: Padding(
          padding: const EdgeInsets.only(bottom: 300),
          child: Row(
            children: <Widget>[
              const Icon(
                Icons.sunny,
                size: 35.0,
                semanticLabel: 'Weather icon',
              ),
              const Positioned(
                bottom: 1,
                child: Text('Sunny and warm'),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.topRight,
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: const <TextSpan>[
                      TextSpan(
                          text: '26',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 75.0)),
                      TextSpan(
                        text: '\u1d52',
                        style: TextStyle(
                          fontSize: 75.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
