import 'package:flutter/material.dart';
//import 'package:workout_app/services/services.dart';
import 'package:workout_app/utilities/database_helper.dart';
import 'package:workout_app/widgets/category_grid_view_widget.dart';
import 'package:workout_app/models/categorie.dart';

class CategoryShowWidget extends StatelessWidget {

  DatabaseHelper databaseHelper = DatabaseHelper();

  final int id;
  CategoryShowWidget(this.id);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xad3a4155),
      child: FutureBuilder(
        future: _loadCategoriesFromDatabase(id),
        //future: obtenirCategoriesFichierJson(id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Object? donneesCategories = snapshot.data;
            return Expanded(
              child: CategoryGridViewWidget(donneesCategories),
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

  Future<List<Categorie>> _loadCategoriesFromDatabase(int id) async {
    await databaseHelper.initializeDatabase();
    List<Categorie> objectiveListMap =
        await databaseHelper.getCategorieListFor(id);
    return objectiveListMap;
  }
}
