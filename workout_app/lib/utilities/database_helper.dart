import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:workout_app/models/objective.dart';
import 'package:workout_app/models/categorie.dart';
import 'package:workout_app/models/exercices.dart';
import 'package:workout_app/services/services.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper; // Singleton DatabaseHelper
  static Database? _database; // Singleton Database

  String tableObjectives = 'objectives';
  String colObjectiveId = 'id';
  String colObjectiveName = 'name';
  String colObjectiveImage = 'image';

  String tableCategories = 'categories';
  String colCategorieId = 'id';
  String colCategorieName = 'name';
  String colCategorieImage = 'image';
  String colCategorieObjectives = 'objectives';

  String tableExercices = 'exercices';
  String colExerciceId = 'id';
  String colExerciceName = 'name';
  String colExerciceDescription = 'description';
  String colExerciceImage = 'image';
  String colExerciceCategories = 'categories';

  DatabaseHelper._createInstance(); // constructeur nommé pour créer une instance de DatabaseHelper

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper
          ._createInstance(); //Ceci est exécuté une seule fois, c'est la notion singleton object
    }
    return _databaseHelper!;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    //Obtenir le chemin où Android et iOS stockent les bases de données.
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'workoutDB.db');
    print(path);

    //Créer et ouvrir la base de données
    var workoutDB = await openDatabase(path, version: 1, onCreate: _createDb);
    return workoutDB;
  }

// ================================================================
// === CREATING TABLES FOR OBJECTIVES, CATEGORIES AND EXERCICES ===
// ================================================================

  void _createDb(Database db, int laVersion) async {
    await db.execute(
        'CREATE TABLE $tableObjectives($colObjectiveId INTEGER PRIMARY KEY AUTOINCREMENT, $colObjectiveName TEXT, '
        '$colObjectiveImage TEXT)');
    await db.execute(
        'CREATE TABLE $tableCategories($colCategorieId INTEGER PRIMARY KEY AUTOINCREMENT, $colCategorieName TEXT, '
        '$colCategorieImage TEXT, $colCategorieObjectives INTEGER[])');
    await db.execute(
        'CREATE TABLE $tableExercices($colExerciceId INTEGER PRIMARY KEY AUTOINCREMENT, $colExerciceName TEXT, '
        '$colExerciceDescription TEXT, $colExerciceImage TEXT, $colExerciceCategories INTEGER[])');

    print('Database created');

    final objectives = await getObjectivesFromJsonFile();
    final categories = await getCategoriesFromJsonFile();
    final exercices = await getExercicesFromJsonFile();

    for (var objective in objectives) {
      await db.execute("INSERT INTO $tableObjectives values (?, ?, ?)",
          [null, objective.name, objective.image]);
    }

    for (var categorie in categories) {
      await db.execute("INSERT INTO $tableCategories values (?, ?, ?, ?)",
          [null, categorie.name, categorie.image, categorie.objectives]);
    }

    for (var exercice in exercices) {
      await db.execute("INSERT INTO $tableExercices values (?, ?, ?, ?, ?)", [
        null,
        exercice.name,
        exercice.description,
        exercice.image,
        exercice.categories
      ]);
    }
  }

// ================================================================
// =============== CRUD OPERATIONS FOR OBJECTIVES =================
// ================================================================

  Future<List<Map<String, dynamic>>> getObjectviesMapList() async {
    Database db = await database; //Appel Ã  la mÃ©thode get database
    //var resultat =
    //await db.rawQuery('SELECT * FROM $tableFilms order by $colTitre ASC');
    var resultat =
        await db.query(tableObjectives, orderBy: '$colObjectiveName ASC');
    //print(resultat);
    return resultat;
  }

  Future<int> addObjective(Objective oneObjective) async {
    Database db = await database;
    var resultat =
        await db.insert(tableObjectives, oneObjective.fromObjectToMap());
    return resultat;
  }

  Future<int> modidifyObjective(Objective oneObjective) async {
    var db = await database;
    var resultat = await db.update(
        tableObjectives, oneObjective.fromObjectToMap(),
        where: '$colObjectiveId = ?', whereArgs: [oneObjective.id]);
    return resultat;
  }

  Future<int> removeObjective(int id) async {
    var db = await database;
    int resultat = await db
        .rawDelete('DELETE FROM $tableObjectives WHERE $colObjectiveId = $id');
    return resultat;
  }

  //Obtenir le nombre d'OBJECTIVES dans la bd
  Future<int> objectiveCount() async {
    Database db = await database;
    List<Map<String, dynamic>> objectiveList =
        await db.rawQuery('SELECT COUNT (*) from $tableObjectives');
    int? objectiveCount = Sqflite.firstIntValue(objectiveList);
    return objectiveCount ?? 0;
  }

  // From map List to object List
  Future<List<Objective>> getObjectiveList() async {
    List<Objective> objectiveObjectList = [];
    var objectiveMapList =
        await getObjectviesMapList(); //Liste map de la base de données
    //Créer la liste d'objets Objective à partir de objectiveMapList
    objectiveObjectList = objectiveMapList
        .map((oneMap) => Objective.fromMapToObject(oneMap))
        .toList();
    return objectiveObjectList;
  }

// ================================================================
// =============== CRUD OPERATIONS FOR CATEGORIES =================
// ================================================================

  Future<List<Map<String, dynamic>>> getCategoriesMapList() async {
    Database db = await database;
    var resultat =
        await db.query(tableCategories, orderBy: '$colCategorieName ASC');
    return resultat;
  }

  Future<int> addCategorie(Categorie oneCategorie) async {
    Database db = await database;
    var resultat =
        await db.insert(tableCategories, oneCategorie.fromObjectToMap());
    return resultat;
  }

  Future<int> modidifyCategorie(Categorie oneCategorie) async {
    var db = await database;
    var resultat = await db.update(
        tableCategories, oneCategorie.fromObjectToMap(),
        where: '$colCategorieId = ?', whereArgs: [oneCategorie.id]);
    return resultat;
  }

  Future<int> removeCategorie(int id) async {
    var db = await database;
    int resultat = await db
        .rawDelete('DELETE FROM $tableCategories WHERE $colCategorieId = $id');
    return resultat;
  }

  //Obtenir le nombre de CATEGORIES dans la bd
  Future<int> categorieCount() async {
    Database db = await database;
    List<Map<String, dynamic>> categorieList =
        await db.rawQuery('SELECT COUNT (*) from $tableCategories');
    int? categorieCount = Sqflite.firstIntValue(categorieList);
    return categorieCount ?? 0;
  }

  // From map List to object List
  Future<List<Categorie>> getCategorieList() async {
    List<Categorie> categorieObjectList = [];
    var categorieMapList = await getCategoriesMapList();
    categorieObjectList = categorieMapList
        .map((oneMap) => Categorie.fromMapToObject(oneMap))
        .toList();
    return categorieObjectList;
  }

// ================================================================
// =============== CRUD OPERATIONS FOR EXERCICES ==================
// ================================================================

  Future<List<Map<String, dynamic>>> getExercicesMapList() async {
    Database db = await database;
    var resultat =
        await db.query(tableExercices, orderBy: '$colExerciceName ASC');
    return resultat;
  }

  Future<int> addExercice(Exercice oneExercice) async {
    Database db = await database;
    var resultat =
        await db.insert(tableExercices, oneExercice.fromObjectToMap());
    return resultat;
  }

  Future<int> modidifyExercice(Exercice oneExercice) async {
    var db = await database;
    var resultat = await db.update(
        tableExercices, oneExercice.fromObjectToMap(),
        where: '$colExerciceId = ?', whereArgs: [oneExercice.id]);
    return resultat;
  }

  Future<int> removeExercice(int id) async {
    var db = await database;
    int resultat = await db
        .rawDelete('DELETE FROM $tableExercices WHERE $colExerciceId = $id');
    return resultat;
  }

  //Obtenir le nombre d'EXERCICES dans la bd
  Future<int> exerciceCount() async {
    Database db = await database;
    List<Map<String, dynamic>> exerciceList =
        await db.rawQuery('SELECT COUNT (*) from $tableExercices');
    int? exerciceCount = Sqflite.firstIntValue(exerciceList);
    return exerciceCount ?? 0;
  }

  // From map List to object List
  Future<List<Exercice>> getExerciceList() async {
    List<Exercice> exerciceObjectList = [];
    var exerciceMapList = await getExercicesMapList();
    exerciceObjectList = exerciceMapList
        .map((oneMap) => Exercice.fromMapToObject(oneMap))
        .toList();
    return exerciceObjectList;
  }
}
