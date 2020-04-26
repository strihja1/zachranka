import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zachranka/pages/home.dart';

class MapOfHospitals extends StatefulWidget {
  @override
  _MapOfHospitalsState createState() => _MapOfHospitalsState();
}



class _MapOfHospitalsState extends State<MapOfHospitals> {
  final Completer<GoogleMapController> _controller = Completer();
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager = true;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(position.latitude, position.longitude),
    zoom: 14.4746,
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mapa nemocnic'),backgroundColor: Colors.red,),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}