import 'dart:convert';
import 'package:flutter/material.dart';
import './../models/categorie.dart';
import 'ecran_exercices.dart';

Future<List<Categorie>> obtenirCategoriesFichierJson(BuildContext context, int id) async {
  String jsonString = await DefaultAssetBundle.of(context)
      .loadString('assets/data/exercices.json');
  List<dynamic> listeCategories = await jsonDecode(jsonString)['categories'];
  var items = listeCategories.map((categories) => Categorie.fromJson(categories)).toList().where((element) => element.objectives.contains(id)).toList();
  return items;
}

Future navigerEcrans(context, ecran) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => ecran));
}
class EcranCategories extends StatelessWidget {
  final int id;
  final String category;
  EcranCategories (this.id, this.category);
  //debugPrint(items[1].categories.contains(3).toString());
  //debugPrint(items[1].categories[1].toString());

  @override
  Widget build(BuildContext context) {
    debugPrint("TEST TEST TEST YULIA: " + id.toString());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff3a4155),
        appBar: AppBar(
          title: Text(category, style: TextStyle(color: Color(0xff489b9b))),
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
          child: FutureMontrerListeCategories(this.id),
        ),
      ),
    );
  }
}
class FutureMontrerListeCategories extends StatelessWidget {
  final int id;
  FutureMontrerListeCategories(this.id);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xad3a4155),
      child: FutureBuilder(
        future: obtenirCategoriesFichierJson(context, id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Object? donneesCategories = snapshot.data;
            return Expanded(
              child: obtenirGridView(context, donneesCategories),
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

Widget obtenirGridView(context, donneesCategories) {
  return GridView.builder(
    itemCount: donneesCategories.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: MediaQuery.of(context).orientation == Orientation.landscape ? 3 : 2,
      crossAxisSpacing: 17,
      mainAxisSpacing: 1,
      childAspectRatio: (1 / 1),
    ),
    itemBuilder: (context, index,) {
      return GestureDetector(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              WorkoutCard(donneesCategories[index].id, donneesCategories[index].image, donneesCategories[index].name),
            ],
          ),
        ),
      );
    },
  );
}

class WorkoutCard extends StatelessWidget
{
  final int id;
  final String image;
  final String title;

  WorkoutCard(this.id, this.image, this.title);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),

      child: Container(
        height: 195,
        width: 195,
        child: InkWell(
            onTap: () {
              navigerEcrans(context, EcranExercices(id, title));
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
                          child: Text(title, style: TextStyle(fontSize: 16, color: Color(0xffc8f1f1)),
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
