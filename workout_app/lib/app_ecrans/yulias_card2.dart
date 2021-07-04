import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class YuliasCard2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    //return Text('Yulia will add a card');
    return Container(
      //color: Color(0xff596681),
      //color: Color(0xff3a4155),
        child: GridView.count(

          //primary: false,
          //padding: const EdgeInsets.all(1),
          //crossAxisSpacing: 10,
          mainAxisSpacing: 2,
          crossAxisCount: 2,
          children: <Widget>[
            Container(
              //padding: const EdgeInsets.all(8),
                child: Column(children: <Widget> [
                  FilmsImages('images/torse.jpg'),
                  const Text('Request Request Request')

                ],
                )
            ),

            Container(
              //padding: const EdgeInsets.all(8),
                child: Column(children: <Widget> [
                  FilmsImages('images/high_intensite.jpg'),
                  const Text('Request Request Request')
                ],
                )
            ),

            Container(
              //padding: const EdgeInsets.all(8),
                child: Column(children: <Widget> [
                  FilmsImages('images/high_intensite.jpg'),
                  const Text('Request Request Request')
                ],
                )
            ),

            Container(
              //padding: const EdgeInsets.all(8),
                child: Column(children: <Widget> [
                  FilmsImages('images/high_intensite.jpg'),
                  const Text('Request Request Request')
                ],
                )
            ),

            Container(
              //padding: const EdgeInsets.all(8),
                child: Column(children: <Widget> [
                  FilmsImages('images/high_intensite.jpg'),
                  const Text('Request Request Request')
                ],
                )
            ),

            Container(
              //padding: const EdgeInsets.all(8),
                child: Column(children: <Widget> [
                  FilmsImages('images/high_intensite.jpg'),
                  const Text('Request Request Request')
                ],
                )
            ),

            Container(
              //padding: const EdgeInsets.all(8),
                child: Column(children: <Widget> [
                  FilmsImages('images/high_intensite.jpg'),
                  const Text('Request Request Request')
                ],
                )
            ),


            Container(
              //padding: const EdgeInsets.all(8),
                child: Column(children: <Widget> [
                  Image.asset('images/high_intensite.jpg'),
                  const Text('Request Request Request')
                ],
                )
            ),

            Container(
              //padding: const EdgeInsets.all(8),
                child: Column(children: <Widget> [
                  Image.asset('images/high_intensite.jpg'),
                  const Text('Request Request Request')
                ],
                )
            ),

            Container(
              //padding: const EdgeInsets.all(8),
                child: Column(children: <Widget> [
                  Image.asset('images/high_intensite.jpg'),
                  const Text('Request Request Request')
                ],
                )
            ),
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
    Image image = Image(image: assetImage,width: 170.0,height: 170.0,);
    return Container(child: image,);
  }
}