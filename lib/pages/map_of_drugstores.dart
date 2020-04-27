import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zachranka/src/locations.dart' as locations;

class MapOfDrugstores extends StatefulWidget {
  @override
  _MapOfDrugstoresState createState() => _MapOfDrugstoresState();
}

class _MapOfDrugstoresState extends State<MapOfDrugstores> {
  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {

    print('SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSss');
    final getGoogleHospitals = await locations.getGoogleHospitals();
    setState(() {
      _markers.clear();
      for (final hospital in getGoogleHospitals.hospitals) {
        print('SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSss');
        print('SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSss');
        print(hospital.display_name);
        print('SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSss');
        print('SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSss');
        final marker = Marker(
          markerId: MarkerId(hospital.display_name),
          position: LatLng(hospital.lat, hospital.lon),
          infoWindow: InfoWindow(
            title: hospital.display_name,
          ),
        );
        _markers[hospital.display_name] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Mapa lékáren - TEST'),
            backgroundColor: Colors.red,
          ),
          body: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: const LatLng(50.210361, 15.825211),
              zoom: 14,
            ),
            markers: _markers.values.toSet(),
          ),
        ),
      );
}
