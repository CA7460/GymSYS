import 'package:flutter/material.dart';
import 'dart:convert';
import '../models/sams_models/exercice.dart';
import '../models/sams_models/categorie.dart';
import '../models/sams_models/objective.dart';
import '../models/sams_models/workout.dart';

Future navigerEcrans(context, ecran) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => ecran));
}

class ListerExercices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('allo');
  }
}

// ignore: use_key_in_widget_constructors
class SamsCard extends StatelessWidget {
  //final Map<String, dynamic> workoutDetails;
  //SamsCard(this.workoutDetails);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff2e3338),
              Color(0xff111215),
            ],
          ),
        ),
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: FutureShowObjectivesGrid(),
      ),
    );
  }
}

class FutureShowObjectivesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getWorkoutArray(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Object? workoutArray = snapshot.data;
            return generateCards(context, workoutArray);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

Future<Workout> getWorkoutArray(BuildContext context) async {

  String jsonString = await DefaultAssetBundle.of(context)
      .loadString('assets/data/exercices.json');
  Map<String, dynamic> globalWorkoutArray = json.decode(jsonString);

  List<Exercice> exercices = (globalWorkoutArray['exercices'] as List)
      .map((unExer) => Exercice.fromJson(unExer))
      .toList();
  List<Categorie> categories = (globalWorkoutArray['categories'] as List)
      .map((uneCateg) => Categorie.fromJson(uneCateg))
      .toList();
  List<Objective> objectives = (globalWorkoutArray['objectives'] as List)
      .map((unObjectif) => Objective.fromJson(unObjectif))
      .toList();

  Workout workout = Workout(exercices, categories, objectives);
  return workout;
}

Widget generateCards(context, workout) {
  return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10.0, mainAxisSpacing: 10.0, crossAxisCount: 2),
      itemCount: workout.objectives.length,
      itemBuilder: (context, index) {
        return Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          margin: const EdgeInsets.all(5.0),
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: InkWell(
            onTap: () {
              navigerEcrans(context, ListerExercices());
            },
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xff2e3338),
                    Color(0xff111215),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    //height: 145,
                    child: Image.asset(
                      workout.objectives[index].image,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  const Spacer(),
                  Stack(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 18,
                          ),
                          child: Text(
                            workout.objectives[index].name,
                            style: const TextStyle(
                              fontFamily: "Roboto",
                              color: Color(0xffafb1b3),
                            ),
                          ),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: 13,
                          ),
                          child: Icon(
                            Icons.play_circle_fill,
                            color: Colors.pink,
                            size: 28.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        );
      });
}
