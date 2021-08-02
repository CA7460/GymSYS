import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import '../models/objective.dart';
import '../models/exercices.dart';
import '../models/categorie.dart';


Future<List<Objective>> obtenirObjectiveFichierJson() async {
  String jsonString = await rootBundle.loadString('assets/data/exercices.json');
  List<dynamic> listeObjectives = await jsonDecode(jsonString)['objectives'];
  return listeObjectives.map((objective) => Objective.fromJson(objective)).toList();
}

Future<List<Categorie>> obtenirCategoriesFichierJson(int id) async {
  String jsonString = await rootBundle.loadString('assets/data/exercices.json');
  List<dynamic> listeCategories = await jsonDecode(jsonString)['categories'];
  return listeCategories.map((categories) => Categorie.fromJson(categories)).toList().where((element) => element.objectives.contains(id)).toList();
}

Future<List<Exercice>> obtenirExercicesFichierJson(int id) async {
  String jsonString = await rootBundle.loadString('assets/data/exercices.json');
  List<dynamic> listeExercices = await jsonDecode(jsonString)['exercices'];
  return listeExercices.map((exercice) => Exercice.fromJson(exercice)).toList().where((element) => element.categories.contains(id)).toList();
}