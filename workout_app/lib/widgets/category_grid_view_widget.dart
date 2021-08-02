import 'package:flutter/material.dart';
import 'package:workout_app/widgets/category_workout_widget.dart';

class CategoryGridViewWidget extends StatelessWidget
{
  var donneesCategories;

  CategoryGridViewWidget(this.donneesCategories);

  Widget build(context) {
    return GridView.builder(
      itemCount: donneesCategories.length,
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
                CategoryWorkoutWidget(donneesCategories[index].id, donneesCategories[index].image, donneesCategories[index].name),
              ],
            ),
          ),
        );
      },
    );
  }
}