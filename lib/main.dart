import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Weather App',
    home: Scaffold(
      body: WeatherBBar(),
    ),
  ));
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
      body: Center(
        child: Text('Weather:'),
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
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Locations:'),
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
        currentIndex: _currentIndex,
        onTap: _onTabItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.sunny),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Location',
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
