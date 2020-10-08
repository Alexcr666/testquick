import 'package:flutter/material.dart';
import 'package:testquick/ui/screenInicio/screenInfoRequest.dart';
import 'package:testquick/ui/screenInicio/screenInicio.dart';
import 'package:testquick/ui/screenUsuario/screeLogin.dart';
import 'package:testquick/ui/screenUsuario/screenCambiarClave.dart';
import 'package:testquick/ui/screenUsuario/screenCrearUsuario.dart';

routesInicio(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => screenInfoRequest()),
  );
}
routesCrearCuentaFinal(BuildContext context){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => screenCrearUsuario()),
  );
}
routesCambiarClave(BuildContext context){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => screenCambiarClave()),
  );
}


routesLogin(BuildContext context){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => screenLogin()),
  );
}