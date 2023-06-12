import 'package:flutter/material.dart';
import '../main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeatherLabel extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feelslike = ref.watch(feelslikeProvider);
    final wind = ref.watch(windspeedProvider);
    final rain = ref.watch(rainProvider);
    final humidity = ref.watch(humidityProvider);
    return Center(
      child: Card(
        child: Column(
          children: <Widget>[
            const ListTile(
              title: Text(
                'Weather now',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: ListTile(
                    leading: const Icon(Icons.device_thermostat),
                    title: const Text(
                      'Feels like',
                      style: TextStyle(fontSize: 15),
                    ),
                    subtitle: Text(
                      '$feelslike\u1d52',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  // WRAPPED IN EXPANDED TO PREVENT INFINITE HEIGHT ERROR
                  child: ListTile(
                    leading: const Icon(Icons.air),
                    title: const Text(
                      'Wind',
                      style: TextStyle(fontSize: 15),
                    ),
                    subtitle: Text(
                      '$wind km/h',
                      style: const TextStyle(fontWeight: FontWeight.bold),
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
                    leading: const Icon(Icons.beach_access),
                    title: const Text(
                      'Precipitation',
                      style: TextStyle(fontSize: 15),
                    ),
                    subtitle: Text(
                      '$rain mm',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    leading: const Icon(Icons.water_drop),
                    title: const Text(
                      'Humidity',
                      style: TextStyle(fontSize: 15),
                    ),
                    subtitle: Text(
                      '$humidity%',
                      style: const TextStyle(fontWeight: FontWeight.bold),
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
