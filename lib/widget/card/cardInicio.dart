 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testquick/color/color.dart';

Widget widgetCardChat(){
  return Stack(children: [
    Container(
      width: 150,
      height: 200,
      foregroundDecoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.transparent, Colors.transparent, Colors.transparent, colorFondo],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0, 0.3, 0.7, 1],
        ),
      ),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          "https://cdn.pixabay.com/photo/2017/03/04/12/15/programming-2115930__340.jpg",

          fit: BoxFit.cover,

        ),
      ),
    ),

  ],);
}