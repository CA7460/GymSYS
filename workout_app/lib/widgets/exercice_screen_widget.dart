//import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:workout_app/utilities/database_helper.dart';
// import 'package:workout_app/widgets/exercise_show_widget.dart';
import 'package:workout_app/widgets/appbar.dart';
import 'package:workout_app/models/exercices.dart';
import "package:workout_app/models/details.dart";
import 'package:workout_app/widgets/exercice_details_screen_widget.dart';
import 'package:workout_app/widgets/crud_operations_screen.dart';

// ============= EXERCICE CHOSEN FROM CATEGORY_WORKOUT_WIDGET ==============

// servira à se rendre sur une autre page (formulaire) pour modifier un exercice
// et retounrer un string qu'on placera dans un snackbar msg qui s'affichera
// quand on reviendra du formulaire (en cliquant modifier)
Future<String> navigerEcrans(context, ecran) async {
  String reponse = await Navigator.push(
      context, MaterialPageRoute(builder: (context) => ecran));
  return reponse;
}
// ------------------------------------------------------------

// ------ Appeler de category_workout_widget ------------------
// ------ changer pour stateful widget ------------------------
class ExerciseScreenWidget extends StatefulWidget {
  final int categoryId;
  final String categoryName;
  ExerciseScreenWidget(this.categoryId, this.categoryName);

  @override
  State<StatefulWidget> createState() {
    return ExerciceListViewState();
  }
}

class ExerciceListViewState extends State<ExerciseScreenWidget> {
  DatabaseHelper databaseHelper = DatabaseHelper();

  List<Exercice>? exerciceList;
  int exerciceCount = 0;

  var _exerciceListStateKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final AdatpativeAppBar exerciceAppBar =
        AdatpativeAppBar(widget.categoryName.toUpperCase());

    if (exerciceList == null) {
      exerciceList = <Exercice>[];
      updateListView();
    }

    return SafeArea(
      child: Scaffold(
        key: _exerciceListStateKey,
        backgroundColor: Color(0xff3a4155),
        appBar: exerciceAppBar,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image:
                  AssetImage('assets/images/background/background_image1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: ExerciseListView(exerciceList!, widget.categoryName, this),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // créer une instance de Exercice et naviguer à la page CRUD
            Exercice exercice = Exercice(0, "", "", "", "");
            Details details = Details(0, 0, "", "", "", "");
            String snackBarMsg = await navigerEcrans(
              context,
              /*PAGE_CRUD_ADD ex.*/ ExerciceOperations('Ajouter un exercice',
                  widget.categoryName, exercice, details),
            );
            updateListView();
            showSnackBar(snackBarMsg);
          },
          backgroundColor: /*Color(0xff3c505e)*/ Colors.purple,
          tooltip: 'Ajouter un exercice',
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  void updateListView() async {
    await databaseHelper.initializeDatabase();
    List<Exercice> exerciceListMap =
        await databaseHelper.getExerciceListFor(widget.categoryId);
    setState(() {
      this.exerciceList = exerciceListMap;
      this.exerciceCount = exerciceListMap.length;
    });
  }

  void showSnackBar(msg) {
    var snackBar = SnackBar(
      content: Text(msg),
      action: SnackBarAction(label: "Fermer", onPressed: () {}),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

// ======================================================================

class ExerciseListView extends StatelessWidget {
  final List<Exercice> exercices;
  final String categoryName;
  dynamic _listViewStateInstance;

  ExerciseListView(
      this.exercices, this.categoryName, this._listViewStateInstance);
  String _snackBarMsg = "";

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        //padding: const EdgeInsets.all(2),
        itemCount: exercices.length,
        itemBuilder: listBuilder,
      ),
    );
  }

  Widget listBuilder(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        print(exercices[index].name);
        navigerEcrans(context, ExerciceDetailsScreenWidget(exercices[index]));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10 / 2, horizontal: 5),
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
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                right: 35,
                child: PopupMenuButton(
                    icon: Icon(
                      Icons.edit,
                      color: Color(0xff489b9b),
                      size: 18,
                    ),
                    onSelected: (item) =>
                        _onSelected(context, item as int, index, categoryName),
                    itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 0,
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.edit,
                                  color: Colors.black,
                                  size: 22,
                                ),
                                SizedBox(width: 25),
                                Text('Modifier'),
                              ],
                            ),
                          ),
                        ]),
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
                        _onSelected(context, item as int, index, categoryName),
                    itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 1,
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
                          image: AssetImage(exercices[index].image),
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
                                exercices[index].name,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Color(0xff489b9b)),
                                maxLines: 2,
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              exercices[index].description,
                              maxLines: 5,
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
    );
  }

  void _onSelected(
      BuildContext context, int item, int index, String categoryName) async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    var resultat;
    final detailsList =
        await databaseHelper.getDetailsForExercice(exercices[index].id);
    final details = detailsList[0];

    if (item == 0) {
      // Le bouton 'edit' nous amene a une page formulaire pour modifier l'exercice en cours
      // Les champs text du formulaire sont rempli avec les details de l'exercice en cours
      // Après modification, un string est retourné dans la variable _snackBarMsg
      // Et le msg est passé à la méthode showSnackBar
      //
      _snackBarMsg = await navigerEcrans(
          context,
          ExerciceOperations(
              'Modifier l\'exercice', categoryName, exercices[index], details));
    } else {
      resultat = await databaseHelper.removeExercice(exercices[index].id);
      print('ok');
      resultat = await databaseHelper.removeDetails(exercices[index].id);

      if (resultat != 0) {
        _snackBarMsg = 'L\'exercice a été supprimé';
      } else {
        _snackBarMsg = 'L\'exercice n\'a pu être supprimé';
      }

    }

 

    await _listViewStateInstance.updateListView();
    await _listViewStateInstance.showSnackBar(_snackBarMsg);
  }
}
