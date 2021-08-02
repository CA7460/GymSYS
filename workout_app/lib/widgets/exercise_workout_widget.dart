import 'package:flutter/material.dart';
import 'package:workout_app/widgets/category_screen_widget.dart';

Future navigerEcrans(context, ecran) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => ecran));
}

class ExerciseWorkoutWidget extends StatelessWidget
{
  final int id;
  final String image;
  final String title;

  ExerciseWorkoutWidget(this.id, this.image, this.title);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),

      child: Container(
        height: 195,
        width: 195,
        child: InkWell(
            onTap: () {
              navigerEcrans(context, CategoryScreenWidget(id, title));
            },
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 180,
                        height: 180,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            image: AssetImage(image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 15,
                        child: Container(
                          // We use this Container to create a black box that wraps the white text so that the user can read the text even when the image is white
                          width: 150,
                          color: Color(0xc53a4155),
                          padding: EdgeInsets.all(10),
                          child: Text(
                              title,
                              style: TextStyle(fontSize: 16, color: Color(0xffc8f1f1)),
                              textAlign: TextAlign.center
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
}