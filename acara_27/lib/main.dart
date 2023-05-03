import 'dart:ffi';

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(new MaterialApp(
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> agama = [
    "Islam",
    'Kriten Protestan',
    'Kristen Katolik',
    'Hindu',
    'Budha'
  ];

  String _agama = 'Islam';

  String _jk = '';

  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerPass = new TextEditingController();
  TextEditingController controllerMoto = new TextEditingController();

  void _pilihJk(String value) {
    setState(() {
      _jk = value;
    });
  }

  void pilihAgama(String value) {
    setState(() {
      _agama = value;
    });
  }

  void kirimdata() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Container(
        height: 200.0,
        child: new Column(
          children: <Widget>[
            new Text('Nama Lengkap : ${controllerNama.text}'),
            new Text('Password : ${controllerPass.text}'),
            new Text('Moto Hidup Anda : ${controllerMoto.text}'),
            new Text('Jenis Kelamin : ${_jk}'),
            new Text('Agama : ${_agama}'),
            new ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: new Text("Simpan"),
            )
          ],
        ),
      ),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new Icon(Icons.list),
        title: new Text('Data Diri'),
        backgroundColor: Colors.teal,
      ),
      body: new ListView(
        children: [
          new Container(
            padding: new EdgeInsets.all(10.0),
            child: new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerNama,
                  decoration: new InputDecoration(
                      hintText: 'Nama Lengkap anda',
                      labelText: 'Nama Lengkap',
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0))),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                new TextField(
                  controller: controllerPass,
                  obscureText: true,
                  decoration: new InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0))),
                ),
                new TextField(
                  controller: controllerMoto,
                  maxLines: 3,
                  decoration: InputDecoration(
                      hintText: 'Moto Hidup',
                      labelText: 'Moto Hidup',
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0))),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                new RadioListTile(
                  value: 'Laki-Laki',
                  title: new Text('Laki-Laki'),
                  groupValue: _jk,
                  onChanged: (String? value) {
                    _pilihJk(value!);
                  },
                  activeColor: Colors.blueAccent,
                  subtitle: new Text('Pilih ini Jika Anda Laki-Laki'),
                ),
                new RadioListTile(
                  value: 'Perempuan',
                  title: new Text('Perempuan'),
                  groupValue: _jk,
                  onChanged: (String? value) {
                    _pilihJk(value!);
                  },
                  activeColor: Colors.blueAccent,
                  subtitle: new Text('Pilih Jika Anda Perempuan'),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                new Row(
                  children: <Widget>[
                    new Text(
                      'Agama',
                      style: new TextStyle(
                          fontSize: 18.0, color: Colors.blueAccent),
                    ),
                    new Padding(
                      padding: new EdgeInsets.only(left: 15.0),
                    ),
                    DropdownButton(
                      onChanged: (String? value) {
                        pilihAgama(value!);
                      },
                      value: _agama,
                      items: agama.map((String value) {
                        return new DropdownMenuItem(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                    )
                  ],
                ),
                new ElevatedButton(
                    child: new Text('Simpan'),
                    onPressed: () {
                      kirimdata();
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
