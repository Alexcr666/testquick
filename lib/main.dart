import 'package:flutter/material.dart';
import 'package:testquick/auth/auth.dart';
import 'package:testquick/color/color.dart';
import 'package:testquick/sharedPreferences/sharedPreferences.dart';
import 'package:testquick/string/string.dart';
import 'package:testquick/ui/screenInicio/screenInfoRequest.dart';
import 'package:testquick/ui/screenInicio/screenInicio.dart';
import 'package:testquick/ui/screenUsuario/screeLogin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: stringAppName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: FutureBuilder(
          future: sacarSession(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data != null && snapshot.data != false) {
                uidUser = snapshot.data;
                return screenInfoRequest();
              } else {
                return screenLogin();
              }
            }
            return screenLogin();

            //  return  screenCrearUsuario();
          },
        ));
  }
}
