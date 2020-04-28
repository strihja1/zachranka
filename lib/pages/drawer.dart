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
          AppBar(
            title: const Text('Menu'),
            backgroundColor: Colors.red,
          ),
          ListTile(
            title: const Text('Hlavní strana'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          ListTile(
            title: const Text('Mapa nemocnic'),
            onTap: () {
              Navigator.pushNamed(context, '/map_of_hospitals');
            },
          ),
          ListTile(
            title: const Text('Mapa lékáren'),
            onTap: () {
              Navigator.pushNamed(context, '/map_of_drugstores');
            },
          ),
          ListTile(
            title: const Text('První pomoc'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/first_aid');
            },
          ),
        ],
      ),
    );
  }
}
