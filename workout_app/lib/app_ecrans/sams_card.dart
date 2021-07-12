import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class SamsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
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
        child: GridView.count(
          shrinkWrap: true,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          crossAxisCount: 2,
          children: generateCards(),
        ),
      ),
    );
  }
}

var donnees = [
  {'titre': 'Biceps', 'image': 'images/musculation.jpg'},
  {'titre': 'Endurance', 'image': 'images/endurance.jpg'},
  {'titre': 'Perte de poids', 'image': 'images/perte_de_poids.jpg'},
  {'titre': 'Puissance', 'image': 'images/puissance.jpg'},
  {'titre': 'Flexibilité', 'image': 'images/flexibilite.jpg'},
  {'titre': 'Cardio', 'image': 'images/cardio.jpg'},
  {'titre': 'Maintient', 'image': 'images/garder_la_forme.jpg'},
  {'titre': 'Abdominaux', 'image': 'images/abdominaux.jpg'}
];

List<Widget> generateCards() {
  List<Widget> gymCards = <Widget>[];

  donnees.forEach((workoutGoal) => gymCards.add(Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: const EdgeInsets.all(5.0),
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
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
                  workoutGoal['image']!,
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
                        workoutGoal['titre']!,
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
      )));
  return gymCards;
}
