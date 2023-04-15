import 'package:flutter/material.dart';
import 'package:tugas_pbm_pertemuan_6/page/home_page.dart';
import 'package:tugas_pbm_pertemuan_6/page/register_page.dart';

class LoginPage extends StatelessWidget {
  final String busername;
  final String bpassword;

  LoginPage({required this.busername, required this.bpassword});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: valLogin(
      username: busername,
      password: bpassword,
    ));
  }
}

class valLogin extends StatefulWidget {
  final String username;
  final String password;

  valLogin({required this.username, required this.password});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<valLogin> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void validasiLogin() {
    String ausername = _usernameController.text;
    String apassword = _passwordController.text;

    if (ausername == username && apassword == password) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Login Berhasil!"),
      ));
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => rumusBMI(
                    ausername: ausername,
                  )));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Username atau password salah!"),
      ));
    }
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
                          onPressed: validasiLogin,
                          child: Text('Login'),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.blue),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0))),
                              fixedSize:
                                  MaterialStatePropertyAll(Size(100, 40))),
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            )));
  }
}
