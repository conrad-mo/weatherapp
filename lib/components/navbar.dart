import 'package:flutter/material.dart';
import '../globalvars.dart' as globals;
import '../weatherpage.dart' as weatherpage;

class LocationDrawer extends StatefulWidget {
  const LocationDrawer({super.key});

  @override
  State<LocationDrawer> createState() => _LocationDrawerState();
}

class _LocationDrawerState extends State<LocationDrawer> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(globals.currentlocation),
        actions: <Widget>[
          IconButton(
            onPressed: () => showDialog<String>(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Enter your location'),
                content: TextField(
                  controller: _controller,
                  onSubmitted: (String value) async {
                    Navigator.pop(context);
                    setState(() {
                      List<String> citylist = value.split(',');
                      citylist[1] = citylist[1].split(' ')[1];
                      if (citylist[0] != '' &&
                          !globals.locationlist.contains(citylist[0])) {
                        globals.locationlist.add(citylist[0]);
                        globals.countrylist.add(citylist[1]);
                      }
                      _controller.clear();
                    });
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'City Name, Country Code',
                  ),
                ),
                actions: <Widget>[
                  FilledButton(
                    onPressed: () {
                      Navigator.pop(context, 'Cancel');
                      _controller.clear();
                    },
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            ),
            icon: const Icon(Icons.add),
            tooltip: 'Add new location',
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const SizedBox(
              height: 64.0,
              child: DrawerHeader(
                decoration: BoxDecoration(),
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
                        globals.currentlocation = globals.locationlist[index];
                        globals.currentcountry = globals.countrylist[index];
                        globals.fetchWeather();
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
        children: const [
          weatherpage.WeatherHome(),
          //LocationTwo(),
        ],
      ),
    );
  }
}
