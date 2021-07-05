import 'package:flutter/material.dart';
import './app_ecrans/ecran_depart.dart';

// Ouvrir un emulateur dans Android Studio, click Run ou Ctrl+F5
void main() => runApp(MyWorkoutApp());

// ignore: use_key_in_widget_constructors
class MyWorkoutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            // ignore: prefer_const_constructors
            title: Text(
              'WORKOUT APP',
              style: TextStyle(
                  fontFamily: 'Roboto', color: Color(0xffafb1b3), fontSize: 20, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Color(0xff111215),
          ),
          body: EcranDepart(), //Crée une instance de EcranDepart
          backgroundColor: Color(0xff303436),
        ),
      ),
    );
  }
}
