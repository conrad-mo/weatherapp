import 'package:flutter/material.dart';
import 'components/navbar.dart' as nvbr;
import 'color_schemes.g.dart' as colorscheme;

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
          useMaterial3: true, colorScheme: colorscheme.lightColorScheme),
      darkTheme: ThemeData(
          useMaterial3: true, colorScheme: colorscheme.darkColorScheme),
      themeMode: ThemeMode.system,
      home: const Scaffold(
        body: nvbr.LocationDrawer(),
      ),
    );
  }
}
