import 'package:flutter/material.dart';
import '../globalvars.dart' as globals;
import '../weatherpage.dart' as weatherpage;

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
          weatherpage.WeatherHome(),
          //LocationTwo(),
        ],
      ),
    );
  }
}
