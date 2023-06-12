import 'package:flutter/material.dart';
import '../globalvars.dart' as globals;
import '../main.dart';
import '../weatherpage.dart' as weatherpage;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocationDrawer extends ConsumerWidget {
  final _controller = TextEditingController();

  Widget build(BuildContext context, WidgetRef ref) {
    List<String> citylist = ref.watch(citylistProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(ref.watch(citynameProvider)),
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
                    if (value.contains(',') && value.contains(' ')) {
                      Navigator.pop(context);
                      List<String> citylist = value.split(',');
                      citylist[1] = citylist[1].split(' ')[1];
                      if (citylist[0] != '' &&
                          !globals.locationlist.contains(citylist[0])) {
                        globals.locationlist.add(citylist[0]);
                        globals.countrylist.add(citylist[1]);
                      }
                      ref.read(citylistProvider.notifier).state =
                          globals.locationlist.toList();
                      ref.read(countrylistProvider.notifier).state =
                          globals.countrylist.toList();
                      globals.currentlocation = citylist[0];
                      globals.currentcountry = citylist[1];
                      globals.fetchWeather(ref);
                      ref.read(citynameProvider.notifier).state =
                          globals.currentlocation;
                      ref.read(countrynameProvider.notifier).state =
                          globals.currentcountry;
                      _controller.clear();
                    } else {
                      const Text("Invalid format used");
                    }
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
                itemCount: citylist.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(ref.watch(citylistProvider)[index]),
                    onTap: () {
                      Navigator.pop(context);
                      globals.currentlocation = globals.locationlist[index];
                      globals.currentcountry = globals.countrylist[index];
                      globals.fetchWeather(ref);
                      ref.read(citynameProvider.notifier).state =
                          globals.currentlocation;
                      ref.read(countrynameProvider.notifier).state =
                          globals.currentcountry;
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
