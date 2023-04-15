import 'dart:html';
import 'package:flutter/material.dart';
import 'package:tugas_pbm_pertemuan_6/main.dart';
import 'package:tugas_pbm_pertemuan_6/page/login_page.dart';
import 'package:tugas_pbm_pertemuan_6/page/register_page.dart';

void main() {
  runApp(MyApp());
}

class rumusBMI extends StatefulWidget {
  final String ausername;

  const rumusBMI({required this.ausername});

  @override
  State<rumusBMI> createState() => _rumusBMIState();
}

class _rumusBMIState extends State<rumusBMI> {
  double _tinggi = 0.0;
  double _berat = 0.0;
  double _bmi = 0.0;
  String _hasil = '';

  void _hitungBMI() {
    if (_tinggi > 0 && _berat > 0) {
      setState(() {
        _bmi = _berat / ((_tinggi / 100) * (_tinggi / 100));
        if (_bmi < 18.5) {
          _hasil = "Kurus";
        } else if (_bmi >= 18.5 && _bmi < 25) {
          _hasil = "Normal";
        } else if (_bmi >= 25 && _bmi > 30) {
          _hasil = "Gemuk";
        } else {
          _hasil = "Obesitas";
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.all(20),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(top: 100, bottom: 50),
                child: Text(
                  "BMI Kalkulator",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 32, 32, 32)),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 40),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    _tinggi = double.parse(value);
                  },
                  decoration: InputDecoration(
                      labelText: 'Tinggi',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40))),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 40),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    _berat = double.parse(value);
                  },
                  decoration: InputDecoration(
                      labelText: 'Berat',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40))),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 40),
                child: ElevatedButton(
                  onPressed: _hitungBMI,
                  child: Text('Hitung BMI'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0))),
                      fixedSize: MaterialStatePropertyAll(Size(100, 50))),
                ),
              ),
              Container(
                child: Text(
                  "BMI kamu adalah $_bmi dan masuk dalam kategori $_hasil",
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )),
    );
  }
}
