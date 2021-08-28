import 'package:flutter/material.dart';
import 'package:workout_app/models/objective.dart';
import 'package:workout_app/widgets/exercise_grid_view_widget.dart';
import 'package:workout_app/utilities/database_helper.dart';
import 'package:workout_app/models/exercices.dart';
import 'package:workout_app/widgets/exercise_list_view_widget.dart';
import 'package:workout_app/main.dart';

class ExerciseModifyWidget extends StatelessWidget {
  final Exercice exercice;
  ExerciseModifyWidget(this.exercice);

  DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    String title = this.exercice.name;
    String detail = this.exercice.description;

    return FlatButton(
      child: Icon(
        Icons.edit,
        color: Color(0xff489b9b),
        size: 18,
      ),
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                scrollable: true,
                title: Text('Exercise: '),
                content: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Title',
                            icon: Icon(Icons.title),
                          ),
                          initialValue: exercice.name,
                          onChanged: (value) => title = value,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Details',
                            icon: Icon(Icons.toc),
                          ),
                          minLines: 1,
                          maxLines: 20,
                          keyboardType: TextInputType.multiline,
                          initialValue: exercice.description,
                          onChanged: (value) => detail = value,
                        ),
                      ],
                    ),
                  ),
                ),
                actions: [
                  RaisedButton(
                      child: Text("Update"),
                      onPressed: () {
                        print(title);
                        databaseHelper.modidifyExercice(Exercice(exercice.id, title, exercice.image, detail, exercice.categories));

                        //Navigator.of(context).pushReplacement(databaseHelper.getExerciceList().then((value) => ExerciseListViewWidget(value)));
                        //databaseHelper.getExerciceList().then((value) => Navigator.push(context, MaterialPageRoute(builder: (context) => )));

                        Navigator.pop(context);
                        Navigator.of(context).pop(false);

                      }
                  )
                ],
              );
            });
      },
    );
  }
}
