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
  await new CallNumber().callNumber('112');
}

Position position;
var addresses;
var first;

class _HomeState extends State<Home> {


   Future<Position> getPosition() async{
     position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
     final coordinates = new Coordinates(position.latitude, position.longitude);
     addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
     first = addresses.first;
     setState(() {
     });
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
        title: Text('Záchranka'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Podržením tlačítka zavoláte pomoc', style: TextStyle(fontSize: 22,),),
            Center(
                child: SizedBox(
                  child: new RawMaterialButton(
                    padding: EdgeInsets.all(24),
                    onLongPress: _initCall,
                    fillColor: Colors.red,
                    shape: CircleBorder(),
                    child: Icon(Icons.call, color: Colors.black, size: 40,), onPressed: () {}, ),
                )),
            Column(
              children: <Widget>[
                Text('GPS souřadnice'),
                if(position == null || first == null)
                  Text('Načítání polohy')
                else
                  Column(
                   children: <Widget>[
                     Text('${position.latitude} ${position.longitude}'),
                     Text( '${first.addressLine}')
                   ],
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
