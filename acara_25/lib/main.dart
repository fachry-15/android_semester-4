import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Aplikasi Pendataan Penduduk Kongo",
    debugShowCheckedModeBanner: false,
    home: BelajarForm(),
  ));
}

class BelajarForm extends StatefulWidget {
  @override
  _BelajarFormState createState() => _BelajarFormState();
}

class _BelajarFormState extends State<BelajarForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Form Pengisian"),
        ),
        body: Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: new InputDecoration(
                      hintText: "Masukkan Nama Lengkap Anda",
                      labelText: "Nama Lengkap Anda",
                      icon: Icon(Icons.people),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Tolong Isi NAma Anda';
                      }
                      return null;
                    },
                  ),
                  Padding(padding: EdgeInsets.all(4.0)),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            )));
  }
}
