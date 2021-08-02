import 'package:flutter/material.dart';
import 'package:workout_app/models/objective.dart';
import 'package:workout_app/models/exercices.dart';
import 'package:workout_app/services/services.dart';
import 'package:workout_app/widgets//exercice_screen_widget.dart';
import 'package:workout_app/widgets/category_screen_widget.dart';
import 'package:workout_app/widgets/category_grid_view_widget.dart';
import 'package:workout_app/widgets/exercise_workout_widget.dart';
import 'package:workout_app/widgets/exercise_grid_view_widget.dart';

class ExerciseWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xda3a4155),
      child: FutureBuilder(
        future: obtenirObjectiveFichierJson(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var donneesObjectives = snapshot.data;
            return Expanded(
              child: ExerciseGridViewWidget(donneesObjectives),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}