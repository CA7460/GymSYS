import 'package:flutter/material.dart';
//import 'package:string_validator/string_validator.dart';
import 'package:workout_app/utilities/database_helper.dart';
//import 'package:intl/intl.dart';
import 'package:workout_app/models/exercices.dart';
import 'package:workout_app/models/categorie.dart';
import 'package:workout_app/models/details.dart';
import 'package:workout_app/widgets/appbar.dart';

class ExerciceOperations extends StatefulWidget {
  final String _action;
  final String _categoryName;
  final Exercice _exercice;
  final Details _details;

  ExerciceOperations(
      this._action, this._categoryName, this._exercice, this._details);

  @override
  State<StatefulWidget> createState() {
    return _ExerciceOperationsState(
        this._action, this._categoryName, this._exercice, this._details);
  }
}

class _ExerciceOperationsState extends State<ExerciceOperations> {
  String _action;
  String _categoryName;
  final Exercice _exercice;
  final Details _details;

  _ExerciceOperationsState(
      this._action, this._categoryName, this._exercice, this._details);

  final _categories = [
    "Biceps",
    "Triceps",
    "Épaules",
    "Dos",
    "Abdominaux",
    "Pectoraux",
    "Jambes",
    "Course",
    "Fessiers",
    "Étirements",
    "Focus"
  ];

  String _selectedCategory = "";

  TextEditingController nameController = TextEditingController();
  TextEditingController shortDescController = TextEditingController();
  TextEditingController longDescController = TextEditingController();
  TextEditingController musclesController = TextEditingController();
  TextEditingController executionController = TextEditingController();
  TextEditingController youtubeLinkController = TextEditingController();

  DatabaseHelper databaseHelper = DatabaseHelper();

  var _formEnregKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    //Pour modifier et enlever

    _selectedCategory = _categoryName;
    nameController.text = _exercice.name;
    shortDescController.text = _exercice.description;
    longDescController.text = _details.longDescription;
    musclesController.text = _details.muscles;
    executionController.text = _details.execution;
    youtubeLinkController.text = _details.youtubeLink;
  }

  @override
  Widget build(BuildContext context) {
    final AdatpativeAppBar operationsAppBar =
        AdatpativeAppBar(widget._action.toUpperCase());

    bool _isModificationButtonVisible = true;
    bool _isDeleteButtonVisible = true;
    bool _isAddButtonVisible = false;
    if (this._action == 'Ajouter un exercice') {
      _isModificationButtonVisible = false;
      _isDeleteButtonVisible = false;
      _isAddButtonVisible = true;
    }

    return SafeArea(
      child: Scaffold(
        appBar: operationsAppBar,
        body: Form(
          key: _formEnregKey,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                WorkoutAppLogo(),

                // =========== Exercice NAME =================
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          controller: nameController,
                          onChanged: (value) {
                            _exercice.name = nameController.text;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Entrer un nom';
                            } else if (value.contains(RegExp(r'[0-9]'))) {
                              return 'Le nom ne doit pas contenir de chiffre';
                            }
                            //return null
                          },
                          // style: textStyle,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Nom de l\'exercice',
                            errorStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 25,
                      ),
                      Expanded(
                        child: DropdownButton<String>(
                          items: _categories.map((String uneCateg) {
                            return DropdownMenuItem<String>(
                              value: uneCateg,
                              child: Text(uneCateg),
                            );
                          }).toList(),
                          value: _selectedCategory,
                          onChanged: (String? categ) {
                            setState(() {
                              _selectedCategory = categ!;
                              print(_selectedCategory);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                // =========== SHORT DESCRIPTION =================
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    controller: shortDescController,
                    onChanged: (value) {
                      _exercice.description = shortDescController.text;
                    },
                    // validator: (String value) {
                    //   if (value.isEmpty) {
                    //     return 'Vous devez entrer un rÃ©alisateur';
                    //   }
                    // },
                    // style: textStyle,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Courte description',
                      errorStyle: TextStyle(
                        color: Colors.red,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),

                // =========== Long Description =================
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    controller: longDescController,
                    onChanged: (value) {
                      _details.longDescription = longDescController.text;
                    },
                    validator: (String? value) {
                      if (value == "") {
                        return 'Vous devez entrer un titre';
                      }
                    },
                    //style: textStyle,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Longue description',
                      hintText: 'Maximum 300 caractères',
                      errorStyle: TextStyle(
                        color: Colors.red,
                        fontSize: 16.0,
                      ),
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(5.0),
                      // ),
                    ),
                  ),
                ),

                // =========== MUSCLE (non required) =================
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    controller: musclesController,
                    onChanged: (value) {
                      _details.muscles = musclesController.text;
                    },
                    // validator: (String value) {
                    //   if (value.isEmpty) {
                    //     return 'Vous devez entrer un rÃ©alisateur';
                    //   }
                    // },
                    // style: textStyle,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Muscles solicités (optionnel)',
                      errorStyle: TextStyle(
                        color: Colors.red,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),

                // =========== EXECUTION (non required) =================
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    controller: executionController,
                    onChanged: (value) {
                      _details.execution = executionController.text;
                    },
                    // validator: (String value) {
                    //   if (value.isEmpty) {
                    //     return 'Vous devez entrer un rÃ©alisateur';
                    //   }
                    // },
                    // style: textStyle,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Exécution de l\'exercice (optionnel)',
                      errorStyle: TextStyle(
                        color: Colors.red,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),

                // =========== Youtube Link==========================
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    controller: youtubeLinkController,
                    onChanged: (value) {
                      _details.youtubeLink = youtubeLinkController.text;
                    },
                    // validator: (String value) {
                    //   if (value.isEmpty) {
                    //     return 'Vous devez entrer un rÃ©alisateur';
                    //   }
                    // },
                    // style: textStyle,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Lien Youtube',
                      errorStyle: TextStyle(
                        color: Colors.red,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 5, top: 5),
                  child: Row(
                    children: <Widget>[
                      Visibility(
                        visible: _isModificationButtonVisible,
                        child: Expanded(
                          child: RaisedButton(
                            color: Theme.of(context).accentColor,
                            textColor: Theme.of(context).cardColor,
                            child: Text(
                              'Modifier',
                              textScaleFactor: 1.5,
                            ),
                            onPressed: () async {
                              String reponse = await this
                                  ._enregistrerChangements('modifier');
                              Navigator.pop(context, reponse);
                            },
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _isDeleteButtonVisible,
                        child: Expanded(
                          child: RaisedButton(
                            color: Colors.redAccent,
                            textColor: Theme.of(context).cardColor,
                            child: Text(
                              'Enlever',
                              textScaleFactor: 1.5,
                            ),
                            onPressed: () async {
                              String reponse =
                                  await this._enregistrerChangements('enlever');
                              Navigator.pop(context, reponse);
                            },
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _isAddButtonVisible,
                        child: Expanded(
                          child: RaisedButton(
                            color: Colors.redAccent,
                            textColor: Theme.of(context).cardColor,
                            child: Text(
                              'Enregistrer',
                              textScaleFactor: 1.5,
                            ),
                            onPressed: () async {
                              String reponse =
                                  await _enregistrerChangements('enregistrer');
                              Navigator.pop(context, reponse);
                            },
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
  }

  // void _vider() {
  //   nameController.text = "";
  //   shortDescController.text = "";
  //   longDescController.text = "";
  //   musclesController.text = "";
  //   executionController.text = "";
  //   youtubeLinkController.text = "";
  //   _selectedCategory = "";
  // }

  dynamic _enregistrerChangements(provenance) async {
    var resultat;
    String msg;
    _exercice.name = nameController.text;
    _exercice.description = shortDescController.text;

    // _exercice.image = _exercice.image; // use actual image or default path for new exercice
    print(_exercice.categories);

    _exercice.categories = "1,2,3";
    // for test only, use checkboxes values instead

    _details.longDescription = longDescController.text;
    _details.muscles = musclesController.text;
    _details.execution = executionController.text;
    _details.youtubeLink = youtubeLinkController.text;

    print('tout est prêt');

    if (provenance == 'modifier') {
      resultat = await databaseHelper.modidifyExercice(_exercice);
      resultat = await databaseHelper.modidifyDetails(_details);
      msg = 'modifié';
    } else if (provenance == 'enlever') {
      resultat = await databaseHelper.removeExercice(_exercice.id);
      resultat = await databaseHelper.removeDetails(_details.id);
      msg = 'enlevé';
    } else {
      //enregistrer
      //_exercice.id = null;
      //_details.id = null;
      print('about to add content to databse: type of categories: ' +
          _exercice.categories.runtimeType.toString());
      _exercice.image = "assets/images/exercices/default_img.jpg";

      resultat = await databaseHelper
          .addExercice(_exercice); //Retourne le dernier id inséré
      _exercice.id = resultat;
      print("$resultat : ID du 1er add exercice");
      resultat = await databaseHelper.addDetails(_details);
      _details.id = resultat;
      print("$resultat : ID du 2e add details");
      _details.exerciceID = _exercice.id;

      msg = 'enregistré';
    }
    if (resultat != 0) {
      msg = "Exercice no " + _exercice.id.toString() + " a été $msg";
    } else {
      msg = "Exercice no " + _exercice.id.toString() + " n'a pu être $msg";
    }
    return msg;
  }
}

class WorkoutAppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage =
        AssetImage('assets/images/expansion/dumbell_icon.png');
    Image image = Image(
      image: assetImage,
      width: 100.0,
      height: 100.0,
    );
    return Container(
      child: image,
    );
  }
}
