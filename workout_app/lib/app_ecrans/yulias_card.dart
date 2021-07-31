import 'package:flutter/material.dart';
import 'dart:convert';
import './ecran_exercices.dart';
import './../models/objective.dart';

Future<List<Objective>> obtenirObjectiveFichierJson(BuildContext context) async {
  String jsonString = await DefaultAssetBundle.of(context)
      .loadString('assets/data/exercices.json');
  List<dynamic> listeObjectives = await jsonDecode(jsonString)['objectives'];
  var items = listeObjectives.map((objective) => Objective.fromJson(objective)).toList();
  return items;
}

var test;

Future navigerEcrans(context, ecran) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => ecran));
}

class YuliasCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xda3a4155),
      child: FutureBuilder(
        future: obtenirObjectiveFichierJson(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Object? donneesObjectives = snapshot.data;
            return Expanded(
              child: obtenirGridView(context, donneesObjectives),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

Widget obtenirGridView(context, donneesObjectives) {

  return GridView.builder(
    itemCount: donneesObjectives.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: MediaQuery
          .of(context)
          .orientation ==
          Orientation.landscape ? 3 : 2,
      crossAxisSpacing: 17,
      mainAxisSpacing: 1,
      childAspectRatio: (1 / 1),
    ),
    itemBuilder: (context, index,) {
      //test = donneesObjectives[index].id;
      return GestureDetector(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              WorkoutCard(donneesObjectives[index].image, donneesObjectives[index].name),
            ],
          ),
        ),
      );
    },
  );
}

class WorkoutCard extends StatelessWidget
{
  final String image;
  final String title;

  WorkoutCard(this.image, this.title);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),

      child: Container(
        height: 195,
        width: 195,
        child: InkWell(
            onTap: () {
              navigerEcrans(context, EcranExercices(test));
            },
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 180,
                        height: 180,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            image: AssetImage(image),
                            fit: BoxFit.cover,),
                        ),
                      ),

                      Positioned(
                        bottom: 10,
                        left: 15,

                        child: Container(
                          // We use this Container to create a black box that wraps the white text so that the user can read the text even when the image is white
                          width: 150,
                          color: Color(0xc53a4155),
                          padding: EdgeInsets.all(10),
                          child: Text(
                              title,
                              style: TextStyle(fontSize: 16, color: Color(
                                  0xffc8f1f1)),
                              textAlign: TextAlign.center
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
}
