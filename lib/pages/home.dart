import 'dart:async';

import 'package:call_number/call_number.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:zachranka/pages/drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

void _initCall() async {
  await CallNumber().callNumber('155');
}

Position position;

class _HomeState extends State<Home> {
  dynamic first;

  Future<Position> getPosition() async {
    position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    final Coordinates coordinates =
        Coordinates(position.latitude, position.longitude);
    final List<Address> addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    first = addresses.first;
    setState(() {});
    return position;
  }

  @override
  void initState() {
    super.initState();
    getPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Záchranka'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Podržením tlačítka zavoláte pomoc',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            Center(
                child: SizedBox(
              child: RawMaterialButton(
                padding: const EdgeInsets.all(24),
                onLongPress: _initCall,
                fillColor: Colors.red,
                shape: const CircleBorder(),
                child: Icon(
                  Icons.call,
                  color: Colors.black,
                  size: 40,
                ),
                onPressed: () {},
              ),
            )),
            Column(
              children: <Widget>[
                const Text('GPS souřadnice'),
                if (position == null || first == null)
                  const Text('Načítání polohy')
                else
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      children: <Widget>[
                        Text('${position.latitude} ${position.longitude}'),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${first.addressLine}',
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  )
              ],
            )
          ],
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
