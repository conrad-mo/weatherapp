import 'package:flutter/material.dart';

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
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const Scaffold(
        body: LocationDrawer(),
      ),
    );
  }
}

class LocationOne extends StatefulWidget {
  const LocationOne({super.key});

  @override
  State<LocationOne> createState() => _LocationOneState();
}

class _LocationOneState extends State<LocationOne> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: SafeArea(child: Text('Weather: Markham'))
          //child: Text('Weather:'),
          ),
    );
  }
}

class LocationTwo extends StatefulWidget {
  const LocationTwo({super.key});

  @override
  State<LocationTwo> createState() => _LocationTwoState();
}

class _LocationTwoState extends State<LocationTwo> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(child: SafeArea(child: Text('Weather: Scarborough'))));
  }
}

class LocationDrawer extends StatefulWidget {
  const LocationDrawer({super.key});

  @override
  State<LocationDrawer> createState() => _LocationDrawerState();
}

class _LocationDrawerState extends State<LocationDrawer> {
  final locationlist = <String>["Markham", "Scarborough"];
  String currentlocation = '';
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const SizedBox(
              height: 64.0,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Locations:'),
              ),
            ),
            SizedBox(
              height: double.maxFinite,
              child: ListView.builder(
                itemCount: locationlist.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(locationlist[index]),
                    onTap: () {
                      Navigator.pop(context);
                      setState(() {
                        currentIndex = index;
                        currentlocation = locationlist[index];
                      });
                      // Update the state of the app.
                      // ...
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: const [
          LocationOne(),
          LocationTwo(),
        ],
      ),
    );
  }
}
