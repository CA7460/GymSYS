import 'package:flutter/material.dart';
import 'package:workout_app/widgets/exercice_screen_widget.dart';

Future navigerEcrans(context, ecran) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => ecran));
}

class CategoryWorkoutWidget extends StatelessWidget {
  final int id;
  final String image;
  final String title;

  CategoryWorkoutWidget(this.id, this.image, this.title);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final maxWidthForCard = screenWidth / 2;
    final cardSize = maxWidthForCard - 20;
    final labelWidth = cardSize - 26;

    return InkWell(
      onTap: () {
        navigerEcrans(context, ExerciseScreenWidget(id, title));
      },
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: cardSize,
                height: cardSize,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 14,
                left: (cardSize - labelWidth) / 2,
                child: Container(
                  // black box that wraps the white text
                  width: labelWidth,
                  color: Color(0xc53a4155),
                  padding: EdgeInsets.all(10),
                  child: Text(title,
                      style: TextStyle(
                          fontSize: 16, color: Color(0xffc8f1f1)),
                      textAlign: TextAlign.center),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}