import 'package:flutter/material.dart';
import 'package:zachranka/pages/first_aid.dart';
import 'package:zachranka/pages/home.dart';
import 'package:zachranka/pages/loading.dart';
import 'package:zachranka/pages/map_of_drugstores.dart';
import 'package:zachranka/pages/map_of_hospitals.dart';
import 'package:zachranka/pages/suffocate.dart';
import 'package:zachranka/pages/unconcious.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/loading': (context) => Loading(),
        '/map_of_hospitals': (context) => MapOfHospitals(),
        '/map_of_drugstores': (context) => MapOfDrugstores(),
        '/first_aid': (context) => FirstAid(),
        '/unconscious': (context) => Unconsious(),
        '/suffocate': (context) => Suffocate(),
      },
    ));
