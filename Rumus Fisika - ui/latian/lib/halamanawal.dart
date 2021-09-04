import 'package:flutter/material.dart';
import 'package:latian/isi/hitungfisika.dart';

import 'package:latian/isi/konversi.dart';
import 'Login_Screen.dart';

class Hal extends StatelessWidget {
  const Hal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[200],
        body: SingleChildScrollView(
            child: Stack(children: [
          Center(
            child: Column(children: [
              SizedBox(height: 50),
              MaterialButton(
                  elevation: 20.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  height: 150,
                  child: Column(
                    children: [
                      Container(
                        height: 100.0,
                        child: new Image.asset(
                          'assets/icon/Rectangle.png',
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Hitung Fisika",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HalamanKedua()));
                  }),
              SizedBox(height: 50),
              MaterialButton(
                  elevation: 20.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  height: 150,
                  minWidth: 200,
                  child: Column(
                    children: [
                      Container(
                        height: 100.0,
                        child: new Image.asset(
                          'assets/icon/Balance.png',
                        ),
                      ),
                      Text(
                        "Konversi",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Konversi()));
                  }),
              SizedBox(height: 50),
              MaterialButton(
                  elevation: 20.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  height: 150,
                  minWidth: 200,
                  child: Column(children: [
                    Container(
                      height: 70.0,
                      child: new Image.asset(
                        'assets/icon/Logout.png',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Logout",
                      style: TextStyle(fontSize: 20),
                    ),
                  ]),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => MainPage()),
                        (Route<dynamic> route) => false);
                  })
            ]),
          )
        ])));
  }
}
