import 'dart:async';

import 'package:all_sensors/all_sensors.dart';
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
  calling = true;
  await CallNumber().callNumber('155');
}

Position position;
bool calling = false;

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

  double _proximity;
  double _userAccelerometerX;
  double _userAccelerometerY;
  double _userAccelerometerZ;
  List<StreamSubscription<dynamic>> _streamSubscriptions =
      <StreamSubscription<dynamic>>[];
  Timer timer;

  @override
  void initState() {
    super.initState();
    getPosition();
    initAccelometerState();
    initProximityState();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => getPosition());
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
    for (StreamSubscription<dynamic> subscription in _streamSubscriptions) {
      subscription.cancel();
    }
  }

  void initProximityState() async {
    _streamSubscriptions.add(proximityEvents.listen((ProximityEvent event) {
      setState(() {
        _proximity = event.proximity;
      });
    }));
  }

  void initAccelometerState() async {
    _streamSubscriptions
        .add(userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      setState(() {
        _userAccelerometerX = event.x;
        _userAccelerometerY = event.y;
        _userAccelerometerZ = event.z;
      });
    }));
  }

  Widget _getButton() {
    if (_proximity == null) {
      return Column(children: <Widget>[
        Text("Načítám proximity senzor"),
      ]);
    } else {
      if (_proximity > 2.0) {
        if (_userAccelerometerX > 5 ||
            _userAccelerometerX < -5 ||
            _userAccelerometerY > 5 ||
            _userAccelerometerY < -5 ||
            _userAccelerometerZ > 5 ||
            _userAccelerometerZ < -5) {
          if (calling == false) {
            _initCall();
            calling = false;
          }
        }
        return RawMaterialButton(
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
        );
      } else {
        return RawMaterialButton(
          padding: const EdgeInsets.all(24),
          fillColor: Colors.grey,
          shape: const CircleBorder(),
          child: Icon(
            Icons.call,
            color: Colors.black,
            size: 40,
          ),
          onPressed: () {},
        );
      }
    }
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
            Center(child: SizedBox(child: _getButton())),
            Column(
              children: <Widget>[
                const Text(
                  'GPS souřadnice',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
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
