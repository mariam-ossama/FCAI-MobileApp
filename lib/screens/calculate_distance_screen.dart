
import 'package:geolocator/geolocator.dart';
import 'package:mobile_local_db/models/store_model.dart';

import 'package:flutter/material.dart';
import 'package:mobile_local_db/screens/all_fav_stores_screen.dart';
import 'package:mobile_local_db/widgets/buttomNavigationBar.dart';

class CalculateDistancePage extends StatefulWidget {
  const CalculateDistancePage({super.key});

  @override
  State<CalculateDistancePage> createState() => _CalculateDistancePgeState();
}

class _CalculateDistancePgeState extends State<CalculateDistancePage> {
  Position? _currentPosition;
  double? _distance;

Future<void> _getCurrentLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Check if location services are enabled
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Location services are disabled.'),
        duration: Duration(seconds: 2),
      ),
    );
    return;
  }

  // Request location permissions
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.deniedForever) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Location permissions are permanently denied.'),
        duration: Duration(seconds: 2),
      ),
    );
    return;
  }

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission != LocationPermission.whileInUse &&
        permission != LocationPermission.always) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Location permissions are denied.'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }
  }

  // Get the current position
  Position position = await Geolocator.getCurrentPosition();
  setState(() {
    _currentPosition = position;
  });
}

void _navigateToFavoriteStoresPage() async {
  final selectedStore = await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => MyFavStoresPage()),
  );

  if (selectedStore != null) {
    // Calculate distance between current location and selected store
    double distance = _calculateDistance(selectedStore);
    // Display the distance or perform any other action
    print('Distance: $distance');
      setState(() {
        _distance = distance;
      });
  }
}

double _calculateDistance(StoreModel store) {
  if (_currentPosition == null ||
      store.latitude == null ||
      store.longitude == null) {
    return 0.0;
  }

  double currentLat = _currentPosition!.latitude!;
  double currentLong = _currentPosition!.longitude!;
  double storeLat = store.latitude!;
  double storeLong = store.longitude!;

  double distanceInMeters = Geolocator.distanceBetween(
    currentLat,
    currentLong,
    storeLat,
    storeLong,
  );
  return distanceInMeters / 1000; // Convert distance to kilometers
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){Navigator.pop(context);},
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,),
            ),
        title: Text('Calculate distance',
        style: TextStyle(color: Colors.white),),
        backgroundColor: Color.fromARGB(255, 1, 31, 56),
      ),
      body: ListView(
      children: [
        // Widget to display the user's current location
        ListTile(
          title: Text('Current Location'),
          subtitle: _currentPosition != null
              ? Text(
                  'Latitude: ${_currentPosition!.latitude}\nLongitude: ${_currentPosition!.longitude}',
                )
              : Text('No location detected'),
          trailing: IconButton(
            icon: Icon(Icons.location_searching),
            onPressed: () {
              _getCurrentLocation();
            },
          ),
        ),
        // Widget to select a favorite store
        ListTile(
          title: Text('Select Favorite Store'),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            _navigateToFavoriteStoresPage();
          },
        ),
        ListTile(
            title: Text('Distance'),
            subtitle: _distance != null
                ? Text('${_distance?.toStringAsFixed(2)} km')
                : Text('Distance not calculated'),
          ),
      ],
    ),
      bottomNavigationBar: MyNavigationBar(),
    );
  }
}



