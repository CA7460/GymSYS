import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class SamsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Container(
      height: 220,
      width: double.maxFinite,
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Row(
        children: <Widget>[firstCard, secondCard],
      ),
    );
  }
}

final firstCard = Expanded(
  child: Card(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: Column(
      children: [
        SizedBox(
          height: 165,
          child: Image.asset(
            'images/img1.jpg',
            fit: BoxFit.cover,
          ),
        ),
        const Spacer(),
        const Text(
          'Flexibilité',
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: "Rubik"),
        ),
        const Spacer(),
      ],
    ),
    margin: const EdgeInsets.all(5.0),
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(3),
    ),
  ),
);

final secondCard = Expanded(
  child: Card(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: Column(
      children: [
        SizedBox(
          height: 165,
          child: Image.asset(
            'images/img2.jpg',
            fit: BoxFit.cover,
          ),
        ),
        const Spacer(),
        Stack(
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 15,
                ),
                child: Text('Puissance', style: TextStyle(fontFamily: "Roboto", fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(
                  right: 10,
                ),
                child: Icon(
                  Icons.fitness_center_rounded,
                  color: Colors.black,
                  size: 18.0,
                ),
              ),
            ),
          ],
        ),
        const Spacer(),
      ],
    ),
    margin: const EdgeInsets.all(5.0),
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18),
    ),
  ),
);
