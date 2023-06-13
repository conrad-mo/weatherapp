import 'package:flutter/material.dart';
import 'components/navbar.dart' as nvbr;
import 'color_schemes.g.dart' as colorscheme;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final citynameProvider = StateProvider((ref) => '');
final citylistProvider = StateProvider((ref) => <String>[]);
final countrylistProvider = StateProvider((ref) {
  return <String>[];
});
final countrynameProvider = StateProvider<String>((ref) {
  return "";
});
final weathertempProvider = StateProvider<int>((ref) {
  return 0;
});
final feelslikeProvider = StateProvider<int>((ref) {
  return 0;
});
final windspeedProvider = StateProvider<int>((ref) {
  return 0;
});
final descriptionProvider = StateProvider<String>((ref) {
  return "";
});
final humidityProvider = StateProvider<int>((ref) {
  return 0;
});
final rainProvider = StateProvider<int>((ref) {
  return 0;
});
final fourofourProvider = StateProvider<bool>((ref) {
  return true;
});
final iconindexProvider = StateProvider<int>((ref) {
  return 0;
});
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
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: nvbr.LocationDrawer(),
      ),
    );
  }
}
