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
  List<Widget> widgets = [];

  //const YuliasCard({ @required }) : super();

  Future<void> readJson() async {
    final String response = await rootBundle.rootBundle.loadString('assets/data/exercices.json');

    var data = await jsonDecode(response)['objectives'];
    data.forEach((element)
    {
      var objective = Objective.fromJson(element);

      widgets.add(WorkoutCard(objective.image, objective.name));

      debugPrint(objective.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    readJson();
    return Container(
        color: Color(0xff3a4155),
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(5),
          crossAxisSpacing: 5,
          crossAxisCount: 2,
          children: //widgets
            [WorkoutCard('assets/images/bruler_gras.jpg', 'High intensité')]
      )
    );
  }
}