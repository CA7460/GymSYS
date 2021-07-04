import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/app_ecrans/yulias_card.dart';

class WorkoutCard extends StatelessWidget
{
  final String image;
  final String title;

  WorkoutCard(this.image, this.title);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xff3a4155),
        child: Column(
        children: [
          Card(
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(image)
                  ),
              ),
            ),
            margin: EdgeInsets.fromLTRB(0.0, 7.0, 0.0, 5.0),
          ),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            //color: Color(0xff3a4155)
              color: Color(0xffb5bdcd)
          ),
        ),
      ],
      )
    );
    }

      /*Container(
        child: Column(children: <Widget>[
          FilmsImages(image),
          Padding(
              padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
              child: Text(title,
                  style: TextStyle(
                      fontSize: 16, color: Colors.white24.withOpacity(0.9)))),

        ],
        )
    );*/
  //}
}