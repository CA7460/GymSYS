import 'package:flutter/material.dart';
import 'package:workout_app/utilities/database_helper.dart';
import 'package:workout_app/models/exercices.dart';

class ExerciseUpdateWidget extends StatelessWidget {
  final Exercice exercice;
  ExerciseUpdateWidget(this.exercice);

  DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    String title = this.exercice.name;
    String detail = this.exercice.description;
    String image = this.exercice.image;
    List<dynamic> categories = this.exercice.categories as List<dynamic>;

/*    String categories1 = "";
    databaseHelper.getCategorieList().then((value) => value.forEach((element) {
      print(element.name);
      categories1 += element.name;
      print(categories1);
    }));*/

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add New Exercise"),
        ),
        body: Form(
          child: Column(
            children: <Widget>[
              //TextField()
              /*TextField(
                decoration: InputDecoration(
                labelText: "Test + $categories1",//getCategories(), //'Categories',
                icon: Icon(Icons.ballot_outlined),
                filled: true,
                fillColor: Colors.blueGrey,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),*/
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Title',
                  icon: Icon(Icons.title),
                ),
                initialValue: exercice.name,
                onChanged: (value) => title = value,
              ),
              //initialValue: exercice.categories.toString(),
              //initialValue: getCategories(),
              //onChanged: (value) => title = value,

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

              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Categories',
                  icon: Icon(Icons.ballot_outlined),
                ),
                initialValue: exercice.categories.toString(),
                onChanged: (value) => categories = value as List<dynamic>,
              ),

              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Image',
                  icon: Icon(Icons.add_photo_alternate),
                ),
                minLines: 1,
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                initialValue: exercice.image,
                onChanged: (value) => image = value,
              ),

              RaisedButton(
                  child: Text("Update"),
                  onPressed: () {
                    //print(categories.toString());
                    databaseHelper.modidifyExercice(Exercice(exercice.id, title, image, detail, categories));

                    print(exercice.categories.toString());
                    //Navigator.of(context).pushReplacement(databaseHelper.getExerciceList().then((value) => ExerciseListViewWidget(value)));
                    //databaseHelper.getExerciceList().then((value) => Navigator.push(context, MaterialPageRoute(builder: (context) => )));

                    Navigator.pop(context);

                    //Navigator.of(context).pop(false);

                  }
              ),
              //Text("Test"),

            ],

          ),
        ),
      ),

      /*actions: [
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
      ],*/

/*      actions: [
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
      ],*/
    );

  }

/*  String getCategories() {
    String categories = "";
    databaseHelper.getCategorieList().then((value) => value.forEach((element) {
      print(element.name);
      categories += element.name;
      print(categories);
    }));
   return categories.toString();
  }*/
}
