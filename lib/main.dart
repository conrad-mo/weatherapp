import 'package:flutter/material.dart';
import 'globalvars.dart' as globals;

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

class WeatherHome extends StatefulWidget {
  const WeatherHome({super.key});

  @override
  State<WeatherHome> createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SafeArea(child: Text('Weather: ${globals.currentlocation}'))
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Add new location',
            onPressed: () {
              setState(() {
                globals.locationlist.add('place');
              });
            },
          ),
        ],
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
                itemCount: globals.locationlist.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(globals.locationlist[index]),
                    onTap: () {
                      Navigator.pop(context);
                      setState(() {
                        //globals.currentIndex = index;
                        globals.currentlocation = globals.locationlist[index];
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
        index: globals.currentIndex,
        children: [
          WeatherHome(),
          //LocationTwo(),
        ],
      ),
    );
  }
}
