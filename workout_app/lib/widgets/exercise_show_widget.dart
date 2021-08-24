import 'package:flutter/material.dart';
//import 'package:workout_app/services/services.dart';
import 'package:workout_app/utilities/database_helper.dart';
import 'package:workout_app/widgets/exercise_list_view_widget.dart';
import 'package:workout_app/models/exercices.dart';

class ExerciseShowWidget extends StatelessWidget {
  DatabaseHelper databaseHelper = DatabaseHelper();

  final int id;
  ExerciseShowWidget(this.id);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xad3a4155),
      child: FutureBuilder(
        future: _loadExercicesFromDatabase(id),
        //future: obtenirExercicesFichierJson(id),
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

  Future<List<Exercice>> _loadExercicesFromDatabase(int id) async {
    await databaseHelper.initializeDatabase();
    List<Exercice> exerciceListMap =
        await databaseHelper.getExerciceListFor(id);
    return exerciceListMap;
  }

}
