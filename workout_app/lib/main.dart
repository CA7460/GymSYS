import 'package:flutter/material.dart';
//import 'package:flutter_stetho/flutter_stetho.dart';
import 'package:workout_app/widgets/exercise_widget.dart';

void main() => {/*Stetho.initialize(),*/ runApp(WorkoutApp())};

class WorkoutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xff3a4155),
          appBar: AppBar(
            title:
                Text('WORKOUT APP', style: TextStyle(color: Color(0xff489b9b))),
            centerTitle: true,
            backgroundColor: Color(0xff3c505e),
          ),
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
}
