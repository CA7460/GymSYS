import 'package:flutter/material.dart';
import 'package:workout_app/widgets/exercise_workout_widget.dart';

class ExerciseGridViewWidget extends StatelessWidget {
  var donneesObjectives;
  ExerciseGridViewWidget(this.donneesObjectives);

  @override
  Widget build(context) {
    return GridView.builder(
      itemCount: donneesObjectives.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).orientation == Orientation.landscape ? 3 : 2,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        childAspectRatio: (1 / 1),
      ),
      itemBuilder: (context, index,) {
        return GestureDetector(
          //child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ExerciseWorkoutWidget(donneesObjectives[index].id, donneesObjectives[index].image, donneesObjectives[index].name),
              ],
            ),
          //),
        );
      },
    );
  }
}