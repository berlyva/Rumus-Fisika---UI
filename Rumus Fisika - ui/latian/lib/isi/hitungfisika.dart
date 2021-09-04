import 'package:flutter/material.dart';
import 'package:tabbar/tabbar.dart';

class HalamanKedua extends StatefulWidget {
  @override
  _HalamanKeduaState createState() => _HalamanKeduaState();
}

class _HalamanKeduaState extends State<HalamanKedua> {
  //hitung luas dan volume
  final controller = PageController();
  final _formKey = GlobalKey<FormState>();
  var lebar = 0, panjang = 0, tinggi = 0, hasil1 = 0, hasil2 = 0;

  void hasilLuas() {
    setState(() {
      if (_formKey.currentState.validate()) {
        hasil1 = panjang * lebar;
      }
    });
  }

  void hasiVolume() {
    setState(() {
      if (_formKey.currentState.validate()) {
        hasil2 = panjang * lebar * tinggi;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Hitung Fisika"),
          centerTitle: true,
        ),
        body: TabbarContent(
          controller: controller,
          children: <Widget>[
            //Hitung Luas dan Volume
            SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Luas",
                          style: TextStyle(fontSize: 30),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            panjang = int.parse(value);
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Panjang (P)'),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                            keyboardType: TextInputType.number,
                            onChanged: (value1) {
                              lebar = int.parse(value1);
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Lebar (L)')),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            RaisedButton(
                                child: Text(
                                  'Hitung',
                                  style: TextStyle(color: Colors.white),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                color: Colors.pink,
                                onPressed: () {
                                  hasilLuas();
                                }),
                            Text(
                              hasil1.toString(),
                              style: TextStyle(
                                  color: Colors.black, fontSize: 30.0),
                            )
                          ],
                        ),
                        SizedBox(height: 40),
                        Text("Volume", style: TextStyle(fontSize: 30)),
                        SizedBox(height: 20),
                        TextFormField(
                          onChanged: (value3) {
                            tinggi = int.parse(value3);
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Tinggi (t)'),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            RaisedButton(
                                child: Text(
                                  'Hitung',
                                  style: TextStyle(color: Colors.white),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                color: Colors.pink,
                                onPressed: () {
                                  hasiVolume();
                                }),
                            Text(
                              hasil2.toString(),
                              style:
                                  TextStyle(color: Colors.black, fontSize: 30),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //Hitungan Konversi
          ],
        ));
  }
}
