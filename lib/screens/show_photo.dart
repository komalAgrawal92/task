import 'package:flutter/material.dart';

class ShowPhoto extends StatelessWidget{

  final String photoToShow;
  //final String title;
  ShowPhoto({this.photoToShow});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar:AppBar(title: Text('Photo'),
    ),
    body:Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          child: Image.network(photoToShow),
        ),
        //Text(title),
      ],
    ));
  }
}
