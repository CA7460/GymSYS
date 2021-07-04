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
            appBar: AppBar(
              backgroundColor: Color(0xff3c505e),
              title: Text('WORKOUT APP'),
            ),
            body: YuliasCard()
        ),
      ),
    );
  }
}