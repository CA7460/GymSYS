import 'package:flutter/material.dart';
import './app_ecrans/ecran_depart.dart';
import './app_ecrans/sams_card.dart';
import './app_ecrans/siarheis_card.dart';
import './app_ecrans/yulias_card.dart';

void main() => runApp(MyWorkoutApp());

class MyWorkoutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xff3a4155),
          appBar: AppBar(
            title: Text('WORKOUT APP', style: TextStyle(color: Color(0xff489b9b))),
            centerTitle: true,
            backgroundColor: Color(0xff3c505e),
          ),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background/background_image1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child:  YuliasCard(), //aussi new EcranDepart() mais le new n'est pas obligatoire
          ),
        ),
      ),
    );
  }
}
