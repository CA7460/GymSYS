import 'package:flutter/material.dart';
import 'package:workout_app/widgets/appbar.dart';
import 'package:workout_app/widgets/exercise_widget.dart';

void main() => runApp(WorkoutApp());

class WorkoutApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final AdatpativeAppBar homeAppBar = AdatpativeAppBar('WORKOUT APP');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xff3a4155),
          appBar: homeAppBar,
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/background/background_image1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child:
                ExerciseWidget(), //aussi new EcranDepart() mais le new n'est pas obligatoire
          ),
        ),
      ),
    );
  }

  void _onSelected(BuildContext context, int item) {
    print('you selected option $item');
  }
}
