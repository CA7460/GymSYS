import 'package:flutter/material.dart';
import 'package:workout_app/widgets/appbar.dart';
// import 'package:flutter_stetho/flutter_stetho.dart';
import 'package:workout_app/widgets/exercise_widget.dart';

void main() => {/*Stetho.initialize(), */ runApp(WorkoutApp())};

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
          // AppBar(
          //   backgroundColor: Color(0xff3c505e),
          //   title:
          //       Text('WORKOUT APP', style: TextStyle(color: Color(0xff489b9b))),
          //   //centerTitle: true,
          //   actions: [
          //     PopupMenuButton(
          //         onSelected: (item) => _onSelected(context, item as int),
          //         itemBuilder: (context) => [
          //               PopupMenuItem(
          //                 value: 0,
          //                 child: Text('Add content'),
          //               ),
          //               PopupMenuItem(
          //                 value: 1,
          //                 child: Text('Remove content'),
          //               ),
          //               PopupMenuItem(
          //                 value: 2,
          //                 child: Text('Modify content'),
          //               ),
          //             ])
          //   ],
          // ),
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
