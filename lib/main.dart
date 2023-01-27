import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: WeatherBBar(),
        ),
      ),
    );
  }
}

class WeatherBBar extends StatefulWidget {
  const WeatherBBar({super.key});

  @override
  State<WeatherBBar> createState() => _WeatherBBarState();
}

class _WeatherBBarState extends State<WeatherBBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.sunny),
            label: 'UV Index',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Weather',
          ),
        ],
      ),
    );
  }
}
