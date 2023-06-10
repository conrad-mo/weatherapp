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
                    title: Text('Feels like'),
                    subtitle: Text(
                      '26\u1d52',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    leading: Icon(Icons.air),
                    title: Text('Wind'),
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
                  child: ListTile(
                    leading: Icon(Icons.beach_access),
                    title: Text('Precipitation'),
                    subtitle: Text(
                      '3' '%',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    leading: Icon(Icons.water_drop),
                    title: Text('Humidity'),
                    subtitle: Text(
                      '95' ' %',
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
