import 'dart:html';
import 'package:flutter/material.dart';
import 'package:tugas_pbm_pertemuan_6/page/login_page.dart';

String username = "";
String password = "";

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _register() {
    final String ausername = _usernameController.text;
    final String apassword = _passwordController.text;
    username = ausername;
    password = apassword;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //TODO : bikin tampilan login
        body: Container(
            margin: EdgeInsets.only(top: 150, left: 40, right: 40),
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50, bottom: 20),
                  child: Text(
                    "Selamat datang",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 32, 32, 32)),
                    textAlign: TextAlign.center,
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  elevation: 10,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Column(children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                              labelText: 'Username',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40))),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30, bottom: 30),
                        child: TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40))),
                          obscureText: true,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            _register();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage(
                                          busername: username,
                                          bpassword: password,
                                        )));
                          },
                          child: Text('Daftar'),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.amber),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(40.0))),
                              fixedSize:
                                  MaterialStatePropertyAll(Size(100, 50))),
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            )));
  }
}
