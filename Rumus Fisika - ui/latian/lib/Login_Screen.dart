import 'package:flutter/material.dart';
import 'package:latian/halamanawal.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String username = "", password = "";

  void _tampilkanalert() {
    AlertDialog alertDialog = new AlertDialog(
      title: Text("Warning"),
      content: new Container(
        height: 50.0,
        child: new Center(
          child: new Text("Username dan Password salah"),
        ),
      ),
    );
    showDialog(builder: (context) => alertDialog, context: context);
  }

  void akunLogin() {
    setState(() {
      if (_formKey.currentState.validate()) {
        print("Login Success");
        if ((username == "tester") && (password == "tester")) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Hal()));
        } else {
          _tampilkanalert();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      key: _formKey,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 40),
              Container(
                child: new Image.asset(
                  'assets/images/com.jpg',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Login To Program",
                        style: TextStyle(
                          fontSize: 43,
                          color: Colors.grey[700],
                        ))),
              ),
              SizedBox(height: 20),
              Form(
                child: Container(
                  width: 330,
                  height: 300,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                              validator: (value1) {
                                if (value1.isEmpty) {
                                  return 'masukan username';
                                }
                                return null;
                              },
                              onChanged: (value1) {
                                username = value1;
                              },
                              decoration: InputDecoration(
                                  labelText: "alamat email",
                                  hintText: "@mail.com :",
                                  prefixIcon: Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 12.0),
                                    child: Icon(Icons.verified_user),
                                  ),
                                  border: OutlineInputBorder())),
                          SizedBox(height: 20),
                          TextFormField(
                              validator: (value2) {
                                if (value2.length < 6) {
                                  return 'password tidak boleh kurang dari 6 digit';
                                }
                                return null;
                              },
                              onChanged: (value2) {
                                password = value2;
                              },
                              decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 12.0),
                                    child: Icon(Icons.lock),
                                  ),
                                  labelText: "password",
                                  hintText: "rahasia",
                                  border: OutlineInputBorder())),
                          SizedBox(height: 20),
                          MaterialButton(
                            height: 50,
                            minWidth: 325,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              akunLogin();
                            },
                            color: Colors.grey[700],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
