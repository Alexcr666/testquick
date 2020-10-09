import 'package:flutter/material.dart';
import 'package:testquick/color/color.dart';

estiloTexto(double size, var color, bool bold) {
  return TextStyle(
      fontSize: size,
      color: color,
      fontWeight: bold != true ? FontWeight.normal : FontWeight.bold);
}
estiloCampoTexto(String hint){
  return InputDecoration(
    border: new OutlineInputBorder(
      borderSide: BorderSide(
        width: 0,
        style: BorderStyle.none,
      ),
      borderRadius: const BorderRadius.all(
        const Radius.circular(100),
      ),
    ),
    hintText: hint,
    hintStyle:
    new TextStyle(color: colorTextoOpacidad),
    fillColor: colorBlancoOpacidad,
    filled: true,
  );
}
estiloCampoTextoSearch(String hint){
  return InputDecoration(
    border: new OutlineInputBorder(
      borderSide: BorderSide(
        width: 0,
        style: BorderStyle.none,
      ),
      borderRadius: const BorderRadius.all(
        const Radius.circular(100),
      ),
    ),
    hintText: hint,
    hintStyle:
    new TextStyle(color: Colors.white),
    fillColor: colorTextoOpacidad,
    filled: true,
  );
}
estiloRedondeado(var color,double num){
  return BoxDecoration(
    borderRadius: BorderRadius.circular(num),
    color:color,

  );
}
estiloCampoTextoMulti(String hint){
  return InputDecoration(
    border: new OutlineInputBorder(
      borderSide: BorderSide(
        width: 0,
        style: BorderStyle.none,
      ),
      borderRadius: const BorderRadius.all(
        const Radius.circular(30),
      ),
    ),
    hintStyle:
    new TextStyle(color: colorTextoOpacidad),
    hintText: hint,
    fillColor: colorBlancoOpacidad,
    filled: true,
  );
}

estiloTextoFont1(double size, var color, bool bold) {
  return TextStyle(
      fontSize: size,
      color: color,
      fontFamily: 'hel',
      fontWeight: bold != true ? FontWeight.normal : FontWeight.bold);
}

estiloTextoSpacing(double size, var color, bool bold) {
  return TextStyle(
      fontSize: size,
      color: color,
      letterSpacing: 2.0,
      fontWeight: bold != true ? FontWeight.normal : FontWeight.bold);
}

estiloTextoSpacingFont1(double size, var color, bool bold) {
  return TextStyle(
      fontSize: size,
      color: color,
      letterSpacing: 4.0,
      fontFamily: 'hel',
      fontWeight: bold != true ? FontWeight.normal : FontWeight.bold);
}

estiloTextoSpacingFont4(double size, var color, bool bold) {
  return TextStyle(
      fontSize: size,
      color: color,
      letterSpacing: 1.5,
      fontFamily: 'hel',
      fontWeight: bold != true ? FontWeight.normal : FontWeight.bold);
}

estiloTextoSpacingFont2(double size, var color, bool bold) {
  return TextStyle(
      fontSize: size,
      color: color,
      letterSpacing: 2.0,
      fontFamily: 'hel',
      fontWeight: bold != true ? FontWeight.normal : FontWeight.bold);
}

estiloTexto2(double size, var color, bool bold) {
  return TextStyle(
      fontSize: size,
      color: color,
      fontWeight: bold != true ? FontWeight.normal : FontWeight.bold,
      letterSpacing: 4.0);
}
