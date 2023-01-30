import 'package:flutter/material.dart';

void main() {
  runApp(WeatherApp());
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
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: Scaffold(
        body: WeatherBBar(),
      ),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: SafeArea(child: Text('Weather:'))
          //child: Text('Weather:'),
          ),
    );
  }
}

class UvScreen extends StatefulWidget {
  const UvScreen({super.key});

  @override
  State<UvScreen> createState() => _UvScreenState();
}

class _UvScreenState extends State<UvScreen> {
  final locationlist = <String>["Markham", "Scarborough"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.count(
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: [
            Card(
              color: Colors.blue[300],
              child: Text(locationlist[0]),
            ),
            Card(
              color: Colors.blue[300],
              child: Text(locationlist[1]),
            ),
          ],
        ),
        //child: Text('Locations:'),
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
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        enableFeedback: true,
        fixedColor: Colors.blue,
        currentIndex: _currentIndex,
        onTap: _onTabItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.sunny),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: '',
          ),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          WeatherScreen(),
          UvScreen(),
        ],
      ),
    );
  }

  void _onTabItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
