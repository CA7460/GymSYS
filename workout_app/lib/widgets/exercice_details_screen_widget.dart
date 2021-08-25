import 'package:flutter/material.dart';
import 'package:workout_app/models/exercices.dart';
import 'package:workout_app/widgets/appbar.dart';
import 'package:workout_app/services/services.dart';
import 'package:workout_app/models/details.dart';

class ExerciceDetailsScreenWidget extends StatelessWidget {
  final Exercice _exercice;

  ExerciceDetailsScreenWidget(this._exercice);

  @override
  Widget build(BuildContext context) {
    final AdatpativeAppBar categoryAppBar = AdatpativeAppBar(_exercice.name);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff3a4155),
        appBar: categoryAppBar,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image:
                  AssetImage('assets/images/background/background_image1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: DetailedExerciceWidget(_exercice),
        ),
      ),
    );
  }
}

class DetailedExerciceWidget extends StatelessWidget {
  final Exercice _exercice;

  DetailedExerciceWidget(this._exercice);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xad3a4155),
      child: FutureBuilder(
        //future: _loadDetailssFromDatabase(id),
        future: obtenirDetailsFichierJson(_exercice.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Object? donneesDetails = snapshot.data;
            List<Details> details = donneesDetails as List<Details>;
            return Expanded(
              child: DetailedExerciceLayoutWidget(_exercice.name,
                  _exercice.image, details[_exercice.id]),
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

class DetailedExerciceLayoutWidget extends StatelessWidget {
  final String _name;
  final String _image;
  final Details _details;

  DetailedExerciceLayoutWidget(this._name, this._image, this._details);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Text(_name),
        Image(
          image: AssetImage(_image),
          width: 300,
          height: 200,
        ),
        Text(_details.longDescription),
        Text('Muscles ciblés'),
        Text(_details.muscles),
      ],
    ));
  }
}
