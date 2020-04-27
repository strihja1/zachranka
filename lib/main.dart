import 'package:flutter/material.dart';
import 'package:zachranka/pages/home.dart';
import 'package:zachranka/pages/loading.dart';
import 'package:zachranka/pages/map_of_drugstores.dart';
import 'package:zachranka/pages/map_of_hospitals.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/loading': (context) => Loading(),
        '/map_of_hospitals': (context) => MapOfHospitals(),
        '/map_of_drugstores': (context) => MapOfDrugstores(),
      },
    ));
