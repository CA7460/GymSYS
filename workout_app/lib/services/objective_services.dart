import 'dart:async' show Future;
import 'dart:convert';
import 'package:workout_app/models/objective.dart';
import 'package:flutter/services.dart' show rootBundle;


Future<String> getJson() async {
  return await rootBundle.loadString('assets/data/exercices.json');
}

Future loadStudent() async {
  String jsonString = await getJson();
  final jsonResponse = json.decode(jsonString);
  var objectives = new Objective.fromJson(jsonResponse);
  print(objectives);
}