import 'package:flutter/material.dart';
import 'package:zachranka/pages/drawer.dart';

class FirstAid extends StatefulWidget {
  @override
  _FirstAidState createState() => _FirstAidState();
}

class _FirstAidState extends State<FirstAid> {
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
            Card(
              child: ListTile(
                title: const Text('Bezvědomí'),
                onTap: () {
                  Navigator.pushNamed(context, '/unconscious');
                },
              ),
            ),
            Card(
              child: ListTile(
                title: const Text('Dušení'),
                onTap: () {
                  Navigator.pushNamed(context, '/suffocate');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
