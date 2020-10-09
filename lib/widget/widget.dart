import 'dart:convert';
import 'dart:io';

import 'package:animated_widgets/widgets/opacity_animated.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_crop/image_crop.dart';
import 'package:testquick/Animation/FadeAnimation.dart';
import 'package:testquick/auth/auth.dart';
import 'package:testquick/color/color.dart';

import 'package:testquick/string/string.dart';
import 'package:testquick/utils/style.dart';
import 'package:testquick/utils/utils.dart';

bool estadoLoading;

Widget espaciado(double heigth, double width) {
  return SizedBox(height: heigth, width: width);
}

Widget widgetDivision() {
  return Container(
    height: 0.5,
    width: double.infinity,
    color: Colors.grey,
  );
}

Widget widgetDivider() {
  return Container(
    margin: EdgeInsets.only(left: 5, right: 5),
    width: double.infinity,
    color: Colors.white,
    height: 0.5,
  );
}

Widget widgettextValidadorFormulario(bool estado) {
  return estado != true
      ? espaciado(0, 0)
      : Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(top: 10, bottom: 5, left: 20),
          child: Text(
            "Campo requerido",
            style: TextStyle(color: Colors.red),
          ));
}

Widget widgetOpacity(_display, Widget widget) {
  return OpacityAnimatedWidget.tween(
    opacityEnabled: 1,
    duration: Duration(seconds: 1),

    opacityDisabled: 0,
    //and end value
    enabled: _display,
    //bind with the boolean
    child: Container(
      // height: 200,
      // width: 200,
      child: widget,
    ),
  );
}

Widget widgetImage(String urlFoto, double width, double heigth) {
  return Container(
    width: width,
    height: heigth,
    child:
        /*Image.memory(
      base64Decode(urlFoto),
      height: heigth,
      width: width,
    ),*/
        FadeInImage(
      placeholder: AssetImage('assets/images/placeholder.png'),
      image: MemoryImage(base64Decode(urlFoto)),
      fit: BoxFit.cover,
    ),
  );
}

Widget widgetBottom(BuildContext context, String url, String texto) {
  return Stack(
    children: <Widget>[
      Image.asset("assets/images/image/piePagina.png"),
      Positioned.fill(
        child: Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Expanded(child: SizedBox()),
                  iconSvgColor(url, 32, 32, Colors.white),
                  espaciado(0, 10),
                  Text(
                    texto,
                    style: estiloTextoSpacingFont1(16, Colors.white, true),
                  ),
                  Expanded(child: SizedBox()),
                ],
              ),
            )),
      ),
    ],
  );
}

Widget widgetOpcionTexto(String fecha) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(
              fecha,
              style: estiloTexto(18, colorTexto, true),
            )),
        SizedBox(
          child: SizedBox(),
        ),
        Container(
            margin: EdgeInsets.only(right: 20),
            child: iconSvgColor(
                "assets/images/icon/Icons-19.svg", 30, 30, colorPrimario)),
      ],
    ),
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10) //
          //        <--- border radius here
          ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 5,
          blurRadius: 10,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
  );
}

Widget widgetOpcionTexto2(String fecha) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(
              fecha,
              style: estiloTexto(18, colorPrimario, true),
            )),
        SizedBox(
          child: SizedBox(),
        ),
        Container(
            margin: EdgeInsets.only(right: 20),
            child: iconSvgColor(
                "assets/images/icon/Icons-19.svg", 30, 30, colorPrimario)),
      ],
    ),
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10) //
          //        <--- border radius here
          ),
    ),
  );
}

Widget widgetOpcionesAgregarFotoNetwork(String url) {
  return Container(
    width: 100,
    child: url == null
        ? Icon(
            Icons.add,
            color: colorPrimario,
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.memory(
              base64Decode(url), height: 80, width: 80,
              // fit: BoxFit.cover,
            ),
          ),
    height: 100,
    decoration: new BoxDecoration(
      color: Colors.white,
      borderRadius: new BorderRadius.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
  );
}

Widget iconSvg(String url, double width, double heigth) {
  return Container(
    height: heigth,
    width: width,
    child: SvgPicture.asset(
      url,
      //color: Colors.transparent,
    ),
  );
}

Widget iconSvgColor(String url, double width, double heigth, var color) {
  return Container(
    height: heigth,
    width: width,
    child: SvgPicture.asset(
      url,
      color: color,
    ),
  );
}

Widget widgetCabezera(BuildContext context, String titulo) {
  return Row(
    children: [
      GestureDetector(
          onTap: () {
            funcionAtras(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 40,
          )),
      Expanded(
        child: SizedBox(),
      ),
      Text(
        titulo.toUpperCase(),
        style: estiloTextoSpacingFont1(
            titulo == stringRecuperarClavetxt ? 18 : 23, Colors.white, false),
      ),
      Expanded(
        child: SizedBox(),
      ),
      espaciado(0, 40),
    ],
  );
}

Widget itemDatosBusqueda(String titulo1, String titulo2) {
  return Container(
    margin: EdgeInsets.only(top: 5),
    child: Row(
      children: [
        Text(titulo1.toLowerCase().capitalize().toString() + ": ",
            style: estiloTexto(17, colorTexto, true)),
        Text(titulo2 == "null" ? "" : titulo2.toString(),
            style: estiloTexto(17, colorTexto, false)),
      ],
    ),
  );
}

Widget widgetMisFavoritos(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 100),
    child: Center(
      child: Column(
        children: [
          Container(
            child: iconSvgColor(
                "assets/images/icon/search.svg", 80, 80, colorPrimario),
          ),
          espaciado(30, 0),
          Text(
            " " + stringNoResultados,
            // textAlign: TextAlign.center,
            style: estiloTexto(20, colorPrimario, true),
          ),
        ],
      ),
    ),
  );
}

alertOpcionesLogin(
    var context, String titulo, String descripcion, String image, int route) {
  AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      contentPadding: EdgeInsets.all(0.0),
      content: Container(
        padding: EdgeInsets.all(0.0),
        margin: EdgeInsets.all(0.0),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /*ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: Container(
                width: double.infinity,
                child: Image.asset(
                  image,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),*/
            espaciado(20, 0),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Text(
                titulo.toString(),
                style: estiloTexto(31, colorPrimario, false),
                textAlign: TextAlign.center,
              ),
            ),
            espaciado(30, 0),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Text(
                descripcion.toString(),
                style: estiloTexto(17, Colors.black, true),
                textAlign: TextAlign.center,
              ),
            ),
            descripcion == "" ? SizedBox() : espaciado(30, 0),
            GestureDetector(
              onTap: () {
                if (route == 1) {
                  Navigator.pop(context);
                  Navigator.pop(context);
                }
                if (route == 2) {
                  Navigator.pop(context);
                }
              },
              child: Container(
                  margin: EdgeInsets.only(left: 50, right: 50),
                  height: 60,
                  width: double.infinity,
                  child: buttonStyle(
                      colorPrimario, stringAceptar, 18, Colors.white)),
            ),
            espaciado(70, 0)
          ],
        ),
      ));
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}

Widget buttonApp(String titulo) {
  return FadeAnimation(
    2,
    Container(
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(colors: [
            colorPrimario,
            colorPrimario,
          ])),
      child: Center(
        child: Text(
          titulo,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}

Widget buttonStyle(var color, String texto, double sizeText, var colorText) {
  return Container(
    decoration: new BoxDecoration(
        color: color, borderRadius: new BorderRadius.all(Radius.circular(5))),
    child: Center(
        child: Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Text(
        texto,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: sizeText, color: colorText, fontWeight: FontWeight.bold),
      ),
    )),
  );
}




showProgressGlobal(var context, bool estado) {
  if (estado == true) {
    estadoLoading = true;
    AlertDialog alert_segundario = AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        content: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              Container(
                height: 70,
                child: Image.asset("assets/images/loading.gif"),
                margin: EdgeInsets.only(right: 20),
              ),
              Text(
                "Cargando",
                textAlign: TextAlign.center,
                style: TextStyle(color: colorTexto, fontSize: 22),
              ),
            ],
          ),
        ));
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return alert_segundario;
        });
  } else {
    if (estadoLoading == true) {
      estadoLoading = false;
      Navigator.of(context, rootNavigator: true).pop();
    }
  }
}

flusbarMensaje(String titulo, String mensaje, var color, var context) {
  return Flushbar(
    padding: EdgeInsets.all(22),
    // title: mensaje,

    message: mensaje,
    duration: Duration(seconds: 2),
    backgroundColor: color,
    //  boxShadows: [BoxShadow(color: Colors.red[800], offset: Offset(0.0, 2.0), blurRadius: 3.0,)],
  )..show(context);
}
