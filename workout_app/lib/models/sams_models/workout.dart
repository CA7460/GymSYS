import '/models/sams_models/exercice.dart';
import '/models/sams_models/categorie.dart';
import '/models/sams_models/objective.dart';

class Workout {
  // final Map<String,dynamic> globalWorkoutArray;

  final List<Exercice> exercices;
  final List<Categorie> categories;
  final List<Objective> objectives;

  Workout(this.exercices, this.categories, this.objectives);

  Workout.fromJson(Map<String, dynamic> json)
      : exercices = json['exercices'],
        categories = json['categories'],
        objectives = json['objectives'];

  Map<String, dynamic> toJson() => {
        'exercices': exercices,
        'categories': categories,
        'objectives': objectives
      };
}