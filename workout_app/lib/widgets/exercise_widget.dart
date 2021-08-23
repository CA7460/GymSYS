import 'package:flutter/material.dart';
import 'package:workout_app/models/objective.dart';
import 'package:workout_app/models/exercices.dart';
import 'package:workout_app/services/services.dart';
import 'package:workout_app/widgets//exercice_screen_widget.dart';
import 'package:workout_app/widgets/category_screen_widget.dart';
import 'package:workout_app/widgets/category_grid_view_widget.dart';
import 'package:workout_app/widgets/exercise_workout_widget.dart';
import 'package:workout_app/widgets/exercise_grid_view_widget.dart';
import 'package:workout_app/utilities/database_helper.dart';

class ExerciseWidget extends StatelessWidget {
  
  DatabaseHelper databaseHelper = DatabaseHelper();
  
  //List<Objective> objectiveList = [];
  //int objectiveCount = 0;

  @override
  Widget build(BuildContext context) {
    
    //if (objectiveList == null) {
    //  objectiveList = List<Objective>();
    //  _updateData();
    //}

    return Container(
      color: Color(0xda3a4155),
      child: FutureBuilder(
        future: _loadObjectivesFromDatabase(),
        //future: obtenirObjectiveFichierJson(),
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

  // Future<List<Objective>> _updateData() async {
  //   final Future<Database> dbFuture = databaseHelper.initializeDatabase();
  //   dbFuture.then((database) {
  //     Future<List<Objective>> objectiveListMap = databaseHelper.getObjectiveList();
  //     objectiveListMap.then((objectiveList) {
  //       setState(() {
  //         this.objectiveList = objectiveList;
  //         this.objectiveCount = objectiveList.length;
  //       });
  //     });
  //     return objectiveListMap;
  //   });
  // }

  Future<List<Objective>> _loadObjectivesFromDatabase() async {
    await databaseHelper.initializeDatabase();
    List<Objective> objectiveListMap = await databaseHelper.getObjectiveList();
    return objectiveListMap;
  }
}
