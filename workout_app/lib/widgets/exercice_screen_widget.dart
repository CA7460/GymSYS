//import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:workout_app/widgets/exercise_show_widget.dart';
import 'package:workout_app/widgets/appbar.dart';

class ExerciseScreenWidget extends StatelessWidget {
  final int id;
  final String exercices;
  ExerciseScreenWidget(this.id, this.exercices);

  @override
  Widget build(BuildContext context) {
    final AdatpativeAppBar exerciceAppBar = AdatpativeAppBar(exercices);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff3a4155),
        appBar: exerciceAppBar,
        // AppBar(
        //   title: Text(exercices, style: TextStyle(color: Color(0xff489b9b))),
        //   centerTitle: true,
        //   backgroundColor: Color(0xff3c505e),
        // ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image:
                  AssetImage('assets/images/background/background_image1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: ExerciseShowWidget(this.id),
        ),
      ),
    );
  }
}
