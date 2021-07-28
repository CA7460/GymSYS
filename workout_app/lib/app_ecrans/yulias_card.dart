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
            WorkoutCard('assets/images/objectives/high_intensite.jpg', 'High intensité'),
            WorkoutCard('assets/images/objectives/bruler_gras.jpg', 'Brûler le gras'),
            WorkoutCard('assets/images/objectives/cuisses.jpg', 'Cuisses'),
            WorkoutCard('assets/images/objectives/jambes.jpg', 'Jambes'),
            WorkoutCard('assets/images/objectives/epaules.jpg', 'Épaules'),
            WorkoutCard('assets/images/objectives/torse.jpg', 'Torse'),
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