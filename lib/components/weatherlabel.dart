import 'package:flutter/material.dart';

class WeatherLabel extends StatefulWidget {
  const WeatherLabel({super.key});

  @override
  State<WeatherLabel> createState() => _WeatherLabelState();
}

class _WeatherLabelState extends State<WeatherLabel> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Icon(
              Icons.sunny,
              size: 35.0,
              semanticLabel: 'Weather icon',
            ),
            Positioned(
              bottom: 1,
              child: Text('Sunny and warm'),
            ),
          ],
        ),
        const Spacer(),
        const SizedBox(height: 20),
        RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: const <TextSpan>[
              TextSpan(
                  text: '26',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 75.0)),
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
      ],
    );
  }
}
