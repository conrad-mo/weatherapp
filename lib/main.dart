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
        body: LocationDrawer(),
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
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Text("Hello"),
        //child: Text('Locations:'),
      ),
    );
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
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Locations:'),
            ),
            Container(
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
                        print(index);
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
    );
  }
}
