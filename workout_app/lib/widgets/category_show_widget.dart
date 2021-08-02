import 'package:flutter/material.dart';
import 'package:workout_app/services/services.dart';
import 'package:workout_app/widgets/category_grid_view_widget.dart';

class CategoryShowWidget extends StatelessWidget {
  final int id;
  CategoryShowWidget(this.id);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xad3a4155),
      child: FutureBuilder(
        future: obtenirCategoriesFichierJson(id),
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
}