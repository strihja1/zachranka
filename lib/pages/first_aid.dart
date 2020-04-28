import 'dart:async';

import 'package:call_number/call_number.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:zachranka/pages/drawer.dart';

class FirstAid extends StatefulWidget {
  @override
  _FirstAidState createState() => _FirstAidState();
}

class _FirstAidState extends State<FirstAid> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('První pomoc'),
        backgroundColor: Colors.red,
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              title: const Text('Bezvědomí'),
              onTap: () {
                Navigator.pushNamed(context, '/unconscious');
              },
            ),
            ListTile(
              title: const Text('Dušení'),
              onTap: () {
                Navigator.pushNamed(context, '/suffocate');
              },
            ),
            ListTile(
              title: const Text('Krvácení'),
              onTap: () {
                Navigator.pushNamed(context, '/bleeding');
              },
            ),
            ListTile(
              title: const Text('Otrava'),
              onTap: () {
                Navigator.pushNamed(context, '/poisoning');
              },
            ),
          ],
        ),
      ),
    );
  }
}
