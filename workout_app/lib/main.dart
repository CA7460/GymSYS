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
            title: Text('AppBar Widget'),
          ),
          body: EcranDepart(), //Crée une instance de EcranDepart 
        ),
      ),
    );
  }
}
