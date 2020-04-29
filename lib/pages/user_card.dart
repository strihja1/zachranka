import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zachranka/pages/drawer.dart';

class UserCard extends StatefulWidget {
  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  TextEditingController _textFieldControllerName;
  TextEditingController _textFieldControllerSurname;
  TextEditingController _textFieldControllerAllergies;
  String name = "Nezadáno";
  String surname = "Nezadáno";
  String allergies = "Nezadáno";

  @override
  void initState() {
    super.initState();
    _textFieldControllerName = TextEditingController();
    _readName();
    _textFieldControllerSurname = TextEditingController();
    _readSurname();
    _textFieldControllerAllergies = TextEditingController();

    _readAllergies();
  }

  @override
  Widget build(BuildContext context) {
    double c_height = MediaQuery.of(context).size.height * 0.8;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zdravotní karta'),
        backgroundColor: Colors.red,
      ),
      drawer: AppDrawer(),
      body: Container(
        height: c_height,
        child: Column(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Jméno: $name"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  child: Text('Změnit'),
                  onPressed: () {
                    _showDialogNameEdit();
                  },
                ),
              ),
            ],
          ),
          Divider(
            height: 5,
            color: Colors.black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Příjmení: $surname"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  child: Text('Změnit'),
                  onPressed: () {
                    _showDialogSurnameEdit();
                  },
                ),
              ),
            ],
          ),
          Divider(
            height: 5,
            color: Colors.black,
          ),
          Row(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                  child: Text("Alergie:")),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(allergies),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  child: Text('Změnit'),
                  onPressed: () {
                    _showDialogAllergiesEdit();
                  },
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  void _readName() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'my_name';
    final value = prefs.getString(key) ?? 'Jméno nezadáno';
    print(value);
    setState(() {
      name = value;
    });
  }

  void _saveName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'my_name';
    final value = name;
    await prefs.setString(key, value);
  }

  Future<dynamic> _showDialogNameEdit() {
    return showDialog(
        child: Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: "Zadej jméno"),
                controller: _textFieldControllerName..text = name,
              ),
              FlatButton(
                child: Text("Uložit"),
                onPressed: () {
                  _saveName(_textFieldControllerName.text);
                  setState(() {
                    name = _textFieldControllerName.text;
                  });
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("Zrušit"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
        context: context);
  }

  void _readSurname() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'my_surname';
    final value = prefs.getString(key) ?? 'Příjmení nezadáno';
    print(value);
    setState(() {
      surname = value;
    });
  }

  void _saveSurname(String surname) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'my_surname';
    final value = surname;
    await prefs.setString(key, value);
  }

  Future<dynamic> _showDialogSurnameEdit() {
    return showDialog(
        child: Dialog(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: "Zadej příjmení"),
                controller: _textFieldControllerSurname..text = surname,
              ),
              FlatButton(
                child: Text("Uložit"),
                onPressed: () {
                  _saveSurname(_textFieldControllerSurname.text);
                  setState(() {
                    surname = _textFieldControllerSurname.text;
                  });
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("Zrušit"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
        context: context);
  }

  void _readAllergies() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'my_allergies';
    final value = prefs.getString(key) ?? 'Nejsou žádné alergie';
    print(value);
    setState(() {
      allergies = value;
    });
  }

  void _saveAllergies(String allergies) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'my_allergies';
    final value = allergies;
    await prefs.setString(key, value);
  }

  Future<dynamic> _showDialogAllergiesEdit() {
    return showDialog(
        child: Dialog(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: "Zadej alergie"),
                controller: _textFieldControllerAllergies..text = allergies,
              ),
              FlatButton(
                child: Text("Uložit"),
                onPressed: () {
                  _saveAllergies(_textFieldControllerAllergies.text);
                  setState(() {
                    allergies = _textFieldControllerAllergies.text;
                  });
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("Zrušit"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
        context: context);
  }
}
