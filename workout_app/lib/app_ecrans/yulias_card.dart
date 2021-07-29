import 'package:flutter/material.dart';
import 'package:workout_app/widgets/yulia_card_widget.dart';
import 'package:workout_app/models/objective.dart';
import 'package:workout_app/services/objective_services.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'dart:convert';
import 'dart:core';
import 'package:flutter/foundation.dart';
import 'dart:developer';

class YuliasCard extends StatelessWidget {
  List<Objective> objectives = [];

  Future<void> readJson() async {
    final String response = await rootBundle.rootBundle.loadString('assets/data/exercices.json');
    /*var values = await json.decode(response);*/
    debugPrint(response);
    /*objectives = Objective.fromJson(values);*/
  }

  @override
  Widget build(BuildContext context) {
    readJson();
    objectives.forEach((element)
    {
      print(element.name);
    });

    return Container(
        color: Color(0xff3a4155),
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(5),
          crossAxisSpacing: 5,
          crossAxisCount: 2,
          children: <Widget>[
            WorkoutCard('assets/images/bruler_gras.jpg', 'High intensité')
            /*WorkoutCard('assets/images/bruler_gras.jpg', 'High intensité')*/
          ],
        )
    );
  }
}