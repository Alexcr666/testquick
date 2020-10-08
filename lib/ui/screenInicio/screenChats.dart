import 'package:flutter/material.dart';
import 'package:testquick/color/color.dart';
import 'package:testquick/string/string.dart';
import 'package:testquick/utils/style.dart';
import 'package:testquick/widget/card/cardInicio.dart';
import 'package:testquick/widget/card/cardItemChat.dart';
import 'package:testquick/widget/widget.dart';

class screenChats extends StatefulWidget {
  @override
  _screenChatsState createState() => _screenChatsState();
}

class _screenChatsState extends State<screenChats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorFondo,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xff7747f3),
                Color(0xff48a9f2),

              ],
            ),
           // borderRadius: BorderRadius.all(Radius.circular(80.0))
        ),
        child: ListView(
          children: <Widget>[

           espaciado(40, 0),
            Padding(
              padding: EdgeInsets.only(left: 40.0),
              child: Row(
                children: <Widget>[
                  Text(stringChats,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0)),
                  SizedBox(width: 10.0),

                ],
              ),
            ),
            SizedBox(height: 40.0),
            Container(
              height: MediaQuery.of(context).size.height - 185.0,
              decoration: BoxDecoration(
                color: colorFondo,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
              ),
              child: ListView(
                primary: false,
                padding: EdgeInsets.only(left: 25.0, right: 20.0),
                children: <Widget>[
                  cardItemChat(),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
