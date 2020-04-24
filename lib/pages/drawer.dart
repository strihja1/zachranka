import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          AppBar(title: Text('Menu')),
          ListTile(
            title: Text('Domů'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          ListTile(
            title: Text('Mapa nemocnic'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/map_of_hospitals');
            },
          ),
        ],
      ),
    );
  }
}
