import 'package:flutter/material.dart';
import 'package:workout_app/models/objective.dart';
import 'package:workout_app/widgets/exercise_grid_view_widget.dart';
import 'package:workout_app/utilities/database_helper.dart';

class ExerciseWidget extends StatelessWidget {
  
  DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Color(0xda3a4155),
      child: FutureBuilder(
        future: _loadObjectivesFromDatabase(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var donneesObjectives = snapshot.data;
            return Expanded(
              child: ExerciseGridViewWidget(donneesObjectives),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List<Objective>> _loadObjectivesFromDatabase() async {
    await databaseHelper.initializeDatabase();
    List<Objective> objectiveListMap = await databaseHelper.getObjectiveList();
    return objectiveListMap;
  }
}
