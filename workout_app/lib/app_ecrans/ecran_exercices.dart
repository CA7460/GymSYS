import 'dart:convert';
import 'package:flutter/material.dart';
import './../models/exercices.dart';
import 'package:workout_app/services/services.dart';

class EcranExercices extends StatelessWidget {
  final int id;
  final String exercices;
  EcranExercices(this.id, this.exercices);

  @override
  Widget build(BuildContext context) {
    debugPrint("TEST TEST TEST YULIA: " + id.toString());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff3a4155),
        appBar: AppBar(
          title: Text(exercices, style: TextStyle(color: Color(0xff489b9b))),
          centerTitle: true,
          backgroundColor: Color(0xff3c505e),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background/background_image1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: FutureMontrerListeExercices(this.id),
        ),
      ),
    );
  }
}
class FutureMontrerListeExercices extends StatelessWidget {
  final int id;
  FutureMontrerListeExercices(this.id);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xad3a4155),
      child: FutureBuilder(
        future: obtenirExercicesFichierJson(id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Object? donneesExercices = snapshot.data;
            return Expanded(
              child: obtenirListeView(context, donneesExercices),
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

Widget obtenirListeView(context, donneesExercices) {
  Size size = MediaQuery.of(context).size;

  return ListView.builder(
    itemCount: donneesExercices.length,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 10 / 2, horizontal: 5),
        child: Container(
          height: size.height * 0.2,
          decoration: BoxDecoration(
            // CARD COLOR
              color: Color(0xb622293a),
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 30.0,
                    offset: Offset(1, 1))
              ]),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
                  width: size.width * 0.3,
                  height: size.height * 0.2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image(
                      image: AssetImage(donneesExercices[index].image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: size.width * 0.6,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15, top: 1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          donneesExercices[index].name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Color(0xff489b9b)
                          ),
                          maxLines: 2,
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        Row(
                          children: [
                            Expanded(
                              child: Text(donneesExercices[index].description,
                                maxLines: 4,
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                    color: Color(0xffffffff)
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
