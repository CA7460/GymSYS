import 'dart:convert';
import 'package:flutter/material.dart';
import './../models/exercices.dart';

Future<List<Exercice>> obtenirExercicesFichierJson(BuildContext context) async {
  String jsonString = await DefaultAssetBundle.of(context)
      .loadString('assets/data/exercices.json');
  List<dynamic> listeExercices = await jsonDecode(jsonString)['exercices'];
  var items = listeExercices.map((exercice) => Exercice.fromJson(exercice)).toList().where((element) => element.categories.contains(1)).toList();
  return items;
}

class EcranExercices extends StatelessWidget {
  var test;
  EcranExercices(this.test);

  //debugPrint(items[1].categories.contains(3).toString());
  //debugPrint(items[1].categories[1].toString());

  @override
  Widget build(BuildContext context) {
    debugPrint("TEST TEST TEST YULIA: " + test.toString());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff3a4155),
        appBar: AppBar(
          title: Text('Biceps'),
          backgroundColor: Color(0xff3c505e),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background_image5.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: FutureMontrerListeExercices(),
        ),
      ),
    );
  }
}
class FutureMontrerListeExercices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xad3a4155),
      child: FutureBuilder(
        future: obtenirExercicesFichierJson(context),
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
