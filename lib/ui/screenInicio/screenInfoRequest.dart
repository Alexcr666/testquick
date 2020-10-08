import 'dart:async';

import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testquick/auth/auth.dart';
import 'package:testquick/color/color.dart';

import 'package:testquick/main.dart';

import 'package:testquick/sharedPreferences/sharedPreferences.dart';
import 'package:testquick/string/string.dart';
import 'package:testquick/ui/screenInicio/screenChats.dart';
import 'package:testquick/ui/screenInicio/screenInicio.dart';
import 'package:testquick/ui/screenUsuario/screenEditarPerfil.dart';
import 'package:testquick/utils/routes/routes.dart';
import 'package:testquick/utils/style.dart';
import 'package:testquick/utils/utils.dart';
import 'package:testquick/widget/widget.dart';

class screenInfoRequest extends StatefulWidget {
  screenInfoRequest({Key key}) : super(key: key);

  @override
  _screenInfoRequestState createState() => _screenInfoRequestState();
}

class _screenInfoRequestState extends State<screenInfoRequest> {
  int _currentIndex = 0;

  actualizar() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      backgroundColor: colorFondo,
      // resizeToAvoidBottomInset: false,
      body: new IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          new screenInicio(),
          new screenChats(),
          new screenEditarPerfil(),

        ],
      ),
      // backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: colorFondo,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (newIndex) => setState(() {
            _currentIndex = newIndex;
          }),
          items: [
            BottomNavigationBarItem(
              icon: Container(
                child: iconSvgColor("assets/images/icon/house.svg", 33, 33,
                    _currentIndex != 0 ? colorTextoOpacidad : colorPrimario),
              ),
              title: espaciado(0, 0),
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(top: 5),
                child: iconSvgColor("assets/images/icon/magnifying-glass.svg", 33, 33,
                    _currentIndex != 0 ? colorTextoOpacidad : colorPrimario),
              ),
              title: espaciado(10, 0),
            ),

            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(top: 5),
                child: iconSvgColor("assets/images/icon/avatar.svg", 30, 30,
                    _currentIndex != 3 ? colorTextoOpacidad : colorPrimario),
              ),
              title: espaciado(10, 0),
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    /* if(estadoLogin == 1){
      estadoLogin = 3;
     funcionAtras(context);
    }*/
    // Locale myLocale = Localizations.localeOf(context);
    Timer(Duration(seconds: 2), () {
      final FirebaseMessaging _fcm = FirebaseMessaging();
      _fcm.requestNotificationPermissions();
      _fcm.getToken().then((value) {
        print("token: " + value.toString());
        endPointActualizarTokenUsuario(context, value);

//sendNotification("holaprueba3","",value);
      });

      _fcm.configure(
        onMessage: (Map<String, dynamic> message) async {
          print("onMessage: $message");
          /* showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: ListTile(
              title: Text(message['notification']['title']),
              subtitle: Text(message['notification']['body']),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );*/
        },
        onLaunch: (Map<String, dynamic> message) async {
          print("onLaunch: $message");
          // TODO optional
        },
        onResume: (Map<String, dynamic> message) async {
          print("onResume: $message");
          // TODO optional
        },
      );
    });
    //endPointActualizarReportes(context);
  }
}
