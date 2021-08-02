import 'package:flutter/material.dart';
//import './app_ecrans/ecran_depart.dart';
import './app_ecrans/sams_card.dart';
import './app_ecrans/siarheis_card.dart';
import './app_ecrans/yulias_card.dart';

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
            title: Text('WORKOUT APP'),
          ),
          body: Column(
            children: <Widget>[
              //EcranDepart(), //Crée une instance de EcranDepart
              SamsCard(),
              SiarheisCard(),
              YuliasCard()
            ]
          )
        ),
      ),
    );
  }
}
