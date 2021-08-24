import 'package:flutter/material.dart';
import 'package:workout_app/widgets/category_show_widget.dart';
import 'package:workout_app/widgets/appbar.dart';

class CategoryScreenWidget extends StatelessWidget {
  final int id;
  final String category;
  CategoryScreenWidget(this.id, this.category);

  @override
  Widget build(BuildContext context) {
    final AdatpativeAppBar categoryAppBar = AdatpativeAppBar(category);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff3a4155),
        appBar: categoryAppBar,
        // AppBar(
        //   title: Text(category, style: TextStyle(color: Color(0xff489b9b))),
        //   centerTitle: true,
        //   backgroundColor: Color(0xff3c505e),
        // ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background/background_image1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: CategoryShowWidget(this.id),
        ),
      ),
    );
  }
}