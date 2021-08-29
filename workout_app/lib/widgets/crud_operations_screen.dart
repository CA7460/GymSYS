import 'package:flutter/material.dart';
import 'package:workout_app/utilities/database_helper.dart';
import 'package:workout_app/models/exercices.dart';
import 'package:workout_app/models/details.dart';
import 'package:workout_app/widgets/appbar.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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

  // Sera rempli à l'initialisation de la page
  // Avec la méthode checkCategories()
  final _categorieList = <String, bool>{};
  // = {
  //   "Biceps": false,
  //   "Triceps": false,
  //   "Épaules": false,
  //   "Dos": false,
  //   "Abdominaux": false,
  //   "Pectoraux": false,
  //   "Jambes": false,
  //   "Course": false,
  //   "Fessiers": false,
  //   "Étirements": false,
  //   "Focus": false
  // };

  var categHolder = [];

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

    checkCategories();
    nameController.text = _exercice.name;
    shortDescController.text = _exercice.description;
    longDescController.text = _details.longDescription;
    musclesController.text = _details.muscles;
    executionController.text = _details.execution;
    youtubeLinkController.text = _details.youtubeLink;
  }

  void checkCategories() {
    List<String> categoriesString = _exercice.categories.split(",");
    
    int index = 1;
    _categories.forEach((categorie) {
      if (categoriesString.contains(index.toString()) || categorie == _categoryName) {
        _categorieList[categorie] = true;
      } else {
        _categorieList[categorie] = false;
      }
      index++;
    });
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
                  child: TextFormField(
                    controller: nameController,
                    onChanged: (value) {
                      _exercice.name = nameController.text;
                    },
                    validator: (value) {
                        if (value != "") {
                          return value!.length < 30
                              ? null
                              : 'Maximum 30 caractères';
                        } else if (value!.contains(RegExp(r'[0-9]'))) {
                          return 'Le nom ne doit pas contenir de chiffre';
                        } else {
                          return 'Entrer un nom';
                        }
                    },
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
                // =========== SHORT DESCRIPTION =================
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    controller: shortDescController,
                    onChanged: (value) {
                      _exercice.description = shortDescController.text;
                    },
                    validator: (value) {
                      if (value == "") {
                        return 'Entrer une courte description';
                      }
                    },
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
                    validator: (value) {
                      if (value == "") {
                        return 'Entrer une description détaillée';
                      }
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Longue description',
                      hintText: 'Maximum 300 caractères',
                      errorStyle: TextStyle(
                        color: Colors.red,
                        fontSize: 16.0,
                      ),
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
                // ================ Youtube Link==========================
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    controller: youtubeLinkController,
                    onChanged: (value) {
                      _details.youtubeLink = youtubeLinkController.text;
                    },
                    validator: (value) {
                      if (value != "") {
                        return YoutubePlayer.convertUrlToId(value!) != null
                            ? null
                            : 'URL Youtube non valide';
                      } else {
                        return 'Entrer un lien URL Youtube';
                      }
                    },
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
                // ================= CheckBoxes ==========================
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Catégories',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    children: _categorieList.keys.map((String key) {
                      return CheckboxListTile(
                        title: Text(key),
                        value: _categorieList[key],
                        activeColor: Colors.deepPurple[400],
                        checkColor: Colors.white,
                        onChanged: (value) {
                          setState(() {
                            _categorieList[key] = value!;
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
                // ====================== buttons ==================
                Padding(
                  padding: EdgeInsets.only(bottom: 5, top: 5),
                  child: Row(
                    children: <Widget>[
                      Visibility(
                        visible: _isModificationButtonVisible,
                        child: Expanded(
                          child: RaisedButton(
                            color: Color(0xff3c505e),
                            textColor: Colors.white,
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
                            color: Color(0xff3c505e),
                            textColor: Colors.white,
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
                            color: Color(0xff3c505e),
                            textColor: Colors.white,
                            child: Text(
                              'Enregistrer',
                              textScaleFactor: 1.5,
                            ),
                            onPressed: () async {
                              //check if at least one checkbox is checked
                              if (_formEnregKey.currentState!.validate()) {
                                String reponse = await _enregistrerChangements(
                                    'enregistrer');
                                Navigator.pop(context, reponse);
                              }
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
    _exercice.categories = getCheckedCategories();

    _details.longDescription = longDescController.text;
    _details.muscles = musclesController.text;
    _details.execution = executionController.text;
    _details.youtubeLink = youtubeLinkController.text;

    if (provenance == 'modifier') {
      resultat = await databaseHelper.modidifyExercice(_exercice);
      resultat = await databaseHelper.modidifyDetails(_details);
      msg = 'modifié';
    } else if (provenance == 'enlever') {
      resultat = await databaseHelper.removeExercice(_exercice.id);
      resultat = await databaseHelper
          .removeDetails(_exercice.id); // utiliser le id de l'exercice
      msg = 'enlevé';
    } else {
      // Adding a default image 
      _exercice.image = "assets/images/exercices/default_img.jpg";

      resultat = await databaseHelper
          .addExercice(_exercice); //Retourne le dernier id inséré
      _exercice.id = resultat;

      // lien avec l'autre table 
      _details.exerciceID = _exercice.id;
      resultat = await databaseHelper.addDetails(_details);
      _details.id = resultat;

      msg = 'enregistré';
    }
    if (resultat != 0) {
      msg = "Exercice no " + _exercice.id.toString() + " a été $msg";
    } else {
      msg = "Exercice no " + _exercice.id.toString() + " n'a pu être $msg";
    }
    return msg;
  }

  String getCheckedCategories() {
    String categories = "";
    int index = 1;

    _categorieList.forEach((key, value) {
      if (value == true) {
        categories += index.toString();
        categories += ",";
        categHolder.add(key);
      }
      index++;
    });
    return categories;
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
