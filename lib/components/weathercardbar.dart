import 'package:flutter/material.dart';

class WeatherLabel extends StatefulWidget {
  const WeatherLabel({super.key});

  @override
  State<WeatherLabel> createState() => _WeatherLabelState();
}

class _WeatherLabelState extends State<WeatherLabel> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Card(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                'Weather now',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: ListTile(
                    leading: Icon(Icons.device_thermostat),
                    title: Text(
                      'Feels like',
                      style: TextStyle(fontSize: 15),
                    ),
                    subtitle: Text(
                      '26\u1d52',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  // WRAPPED IN EXPANDED TO PREVENT INFINITE HEIGH ERROR
                  child: ListTile(
                    leading: Icon(Icons.air),
                    title: Text(
                      'Wind',
                      style: TextStyle(fontSize: 15),
                    ),
                    subtitle: Text(
                      '23' ' km/h',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  // WRAPPED IN EXPANDED TO PREVENT INFINITE HEIGH ERROR
                  child: ListTile(
                    leading: Icon(Icons.beach_access),
                    title: Text(
                      'Precipitation',
                      style: TextStyle(fontSize: 15),
                    ),
                    subtitle: Text(
                      '3' ' mm',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    leading: Icon(Icons.water_drop),
                    title: Text(
                      'Humidity',
                      style: TextStyle(fontSize: 15),
                    ),
                    subtitle: Text(
                      '95' '%',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
