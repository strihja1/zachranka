import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zachranka/src/locationsOfDrugstores.dart' as locations;

import 'home.dart';

class MapOfDrugstores extends StatefulWidget {
  @override
  _MapOfDrugstoresState createState() => _MapOfDrugstoresState();
}

class _MapOfDrugstoresState extends State<MapOfDrugstores> {
  @override
  void dispose() {
    super.dispose();
  }

  final Map<String, Marker> _markers = {};

  Future<void> _onMapCreated(GoogleMapController controller) async {
    final getGoogleResults = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
      for (final result in getGoogleResults.results) {
        print(result.formatted_address);
        print(result.geometry.location.lat);
        final marker = Marker(
          markerId: MarkerId(result.formatted_address),
          position: LatLng(
              result.geometry.location.lat, result.geometry.location.lng),
          infoWindow:
              InfoWindow(title: result.name, snippet: result.formatted_address),
        );
        _markers[result.formatted_address] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa lékáren'),
        backgroundColor: Colors.red,
      ),
      body: GoogleMap(
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        trafficEnabled: true,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(position.latitude, position.longitude),
          zoom: 14,
        ),
        markers: _markers.values.toSet(),
      ),
    );
  }
}
