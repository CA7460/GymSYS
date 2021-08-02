import 'package:flutter/material.dart';
import 'package:workout_app/widgets/exercise_workout_widget.dart';

class ExerciseGridViewWidget extends StatelessWidget {
  var donneesObjectives;
  ExerciseGridViewWidget(this.donneesObjectives);

  Widget build(context) {
    return GridView.builder(
      itemCount: donneesObjectives.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).orientation == Orientation.landscape ? 3 : 2,
        crossAxisSpacing: 17,
        mainAxisSpacing: 1,
        childAspectRatio: (1 / 1),
      ),
      itemBuilder: (context, index,) {
        return GestureDetector(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ExerciseWorkoutWidget(donneesObjectives[index].id, donneesObjectives[index].image, donneesObjectives[index].name),
              ],
            ),
          ),
        );
      },
    );
  }
}