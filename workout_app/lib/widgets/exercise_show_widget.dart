import 'package:flutter/material.dart';
import 'package:workout_app/services/services.dart';
import 'package:workout_app/widgets/exercise_list_view_widget.dart';

class ExerciseShowWidget extends StatelessWidget {
  final int id;
  ExerciseShowWidget(this.id);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xad3a4155),
      child: FutureBuilder(
        future: obtenirExercicesFichierJson(id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var donneesExercices = snapshot.data;
            return Expanded(
              child: ExerciseListViewWidget(donneesExercices),
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