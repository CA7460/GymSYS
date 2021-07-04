import 'package:flutter/material.dart';
import 'package:workout_app/widgets/yulia_card_widget.dart';

class YuliasCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xff3a4155),
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(5),
          crossAxisSpacing: 5,
          crossAxisCount: 2,
          children: <Widget>[
            WorkoutCard('images/high_intensite.jpg', 'High intensité'),
            WorkoutCard('images/bruler_gras.jpg', 'Brûler le gras'),
            WorkoutCard('images/cuisses.jpg', 'Cuisses'),
            WorkoutCard('images/jambes.jpg', 'Jambes'),
            WorkoutCard('images/epaules.jpg', 'Épaules'),
            WorkoutCard('images/torse.jpg', 'Torse'),
          ],
        )
    );
  }
}

class FilmsImages extends StatelessWidget
{
  String imagePath = '';

  FilmsImages(String imagePath)
  {
    this.imagePath = imagePath;
  }

  @override
  Widget build(BuildContext context)
  {
    // AssetImage assetImage = AssetImage('images/bruler_gras.jpg');
    AssetImage assetImage = AssetImage(imagePath);
    //Image image = Image(image: assetImage,width: 170.0,height: 170.0,);
    Image image = Image(image: assetImage);
    return Container(child: image,);
  }
}