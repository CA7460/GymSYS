import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class EcranDepart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Container(
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
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        crossAxisCount: 2,
        children: generateCards(),
      ),
    );
  }
}

var donnees = [
  {'titre':'Musculation','image':'images/musculation.jpg'},
  {'titre':'Endurance','image':'images/endurance.jpg'},
  {'titre':'Perte de poids','image':'images/perte_de_poids.jpg'},
  {'titre':'Puissance','image':'images/puissance.jpg'},
  {'titre':'Flexibilité','image':'images/flexibilite.jpg'},
  {'titre':'Cardio','image':'images/cardio.jpg'},
  {'titre':'Maintient','image':'images/garder_la_forme.jpg'},
  {'titre':'Abdominaux','image':'images/abdominaux.jpg'}
];



// final firstCard = Card(
//   clipBehavior: Clip.antiAliasWithSaveLayer,
//   child: Column(
//     children: [
//       SizedBox(
//         height: 154,
//         child: Image.asset(
//           'images/musculation.jpg',
//           fit: BoxFit.cover,
//         ),
//       ),
//       const Spacer(),
//       Stack(
//         // ignore: prefer_const_literals_to_create_immutables
//         children: <Widget>[
//           const Align(
//             alignment: Alignment.centerLeft,
//             child: Padding(
//               padding: EdgeInsets.only(
//                 left: 15,
//               ),
//               child: Text(
//                 'Musculature',
//                 style: TextStyle(fontFamily: "Rubik"),
//               ),
//             ),
//           ),
//           const Align(
//             alignment: Alignment.centerRight,
//             child: Padding(
//               padding: EdgeInsets.only(
//                 right: 10,
//               ),
//               child: Icon(
//                 Icons.fitness_center_rounded,
//                 color: Colors.black,
//                 size: 18.0,
//               ),
//             ),
//           ),
//         ],
//       ),
//       const Spacer(),
//     ],
//   ),
//   margin: const EdgeInsets.all(5.0),
//   elevation: 3,
//   shape: RoundedRectangleBorder(
//     borderRadius: BorderRadius.circular(1),
//   ),
// );

// final secondCard = Card(
//   clipBehavior: Clip.antiAliasWithSaveLayer,
//   child: Column(
//     children: [
//       SizedBox(
//         height: 154,
//         child: Image.asset(
//           'images/flexibilite.jpg',
//           fit: BoxFit.cover,
//         ),
//       ),
//       const Spacer(),
//       Stack(
//         // ignore: prefer_const_literals_to_create_immutables
//         children: <Widget>[
//           const Align(
//             alignment: Alignment.centerLeft,
//             child: Padding(
//               padding: EdgeInsets.only(
//                 left: 15,
//               ),
//               child: Text(
//                 'Flexibilité',
//                 style: TextStyle(
//                     fontFamily: "Roboto", fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),
//           const Align(
//             alignment: Alignment.centerRight,
//             child: Padding(
//               padding: EdgeInsets.only(
//                 right: 10,
//               ),
//               child: Icon(
//                 Icons.fitness_center_rounded,
//                 color: Colors.black,
//                 size: 18.0,
//               ),
//             ),
//           ),
//         ],
//       ),
//       const Spacer(),
//     ],
//   ),
//   margin: const EdgeInsets.all(5.0),
//   elevation: 5,
//   shape: RoundedRectangleBorder(
//     borderRadius: BorderRadius.circular(18),
//   ),
// );

// final thirdCard = Card(
//   child: Container(
//     decoration: BoxDecoration(
//       image: DecorationImage(
//         image: AssetImage("images/perte_de_poids.jpg"),
//         fit: BoxFit.fitHeight,
//         alignment: Alignment.topCenter,
//       ),
//     ),
//     child: Text("Perte de poids"),
//   ),
// );

List<Widget> generateCards() {

  List <Widget> gymCards = <Widget>[];

  donnees.forEach((workoutGoal) =>

      gymCards.add(
          Card(
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
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      Expanded(
                        flex: 8,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 15,
                          ),
                          child: Text(
                            workoutGoal['titre']!,
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 18,
                              color: Color(0xffafb1b3),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: 15,
                          ),
                          child: Icon(
                            Icons.play_circle_fill,
                            color: Colors.pink,
                            size: 30.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          )
      )
  );
  return gymCards;

}