import 'package:flutter/material.dart';
import 'components/navbar.dart' as nvbr;
import 'color_schemes.g.dart' as colorscheme;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final citynameProvider = Provider((ref) => 'Markham');
void main() {
  runApp(
    const ProviderScope(
      child: WeatherApp(),
    ),
  );
}

class WeatherApp extends ConsumerWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
