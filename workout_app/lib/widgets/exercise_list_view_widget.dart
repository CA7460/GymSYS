import 'package:flutter/material.dart';
import 'package:workout_app/widgets/exercice_details_screen_widget.dart';
import 'package:workout_app/models/exercices.dart';
import 'package:workout_app/widgets/exercise_modify_widget.dart';

Future navigerEcrans(context, ecran) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => ecran));
}

class ExerciseListViewWidget extends StatelessWidget {
  var donneesExercices;
  ExerciseListViewWidget(this.donneesExercices);

  Widget build(context) {
    Size size = MediaQuery.of(context).size;

    return ListView.builder(
      itemCount: donneesExercices.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            navigerEcrans(
                context,
                ExerciceDetailsScreenWidget(
                    donneesExercices[index] as Exercice)
            );
          },
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10 / 2, horizontal: 5),
            child: Container(
              height: size.height * 0.2,
              decoration: BoxDecoration(
                  color: Color(0xb622293a),
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 30.0,
                        offset: Offset(1, 1))
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 0,
                      right: 35,
                      child: FlatButton(
                        child: Icon(
                          Icons.edit,
                          color: Color(0xff489b9b),
                          size: 18,
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return ExerciseModifyWidget(donneesExercices[index] as Exercice);
                              });
                        },
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: PopupMenuButton(
                          icon: Icon(
                            Icons.delete,
                            color: Color(0xff489b9b),
                            size: 18,
                          ),
                          onSelected: (item) =>
                              _onSelected(context, item as int),
                          itemBuilder: (context) => [
                                PopupMenuItem(
                                  value: 0,
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.delete,
                                        color: Colors.black,
                                        size: 22,
                                      ),
                                      SizedBox(width: 25),
                                      Text('Supprimer'),
                                    ],
                                  ),
                                ),
                              ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                            width: size.width * 0.3,
                            height: size.height * 0.2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image(
                                image:
                                    AssetImage(donneesExercices[index].image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: size.width * 0.6,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15, top: 1),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: size.width * 0.4,
                                    child: Text(
                                      donneesExercices[index].name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                          color: Color(0xff489b9b)),
                                      maxLines: 2,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    donneesExercices[index].description,
                                    maxLines: 4,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w100,
                                        fontSize: 14,
                                        color: Color(0xffffffff)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _onSelected(BuildContext context, int item) {
    print('you selected option $item');
  }
}
