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

Future widgetAlertConfirmacionSalirSinGuardar(BuildContext context) {
  return showDialog(
    context: context,
    builder: (_) => AlertDialog(
      // title: Text('Notificaciones'),
      content: Text(stringDeseaSalirSinGuardar),
      actions: [
        FlatButton(
            child: Text(stringAceptar),
            textColor: Colors.black,
            onPressed: () {
              Navigator.of(context).pop();

              Navigator.of(context).pop();
            }),
        FlatButton(
            child: Text(stringCancelar),
            textColor: Colors.black,
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ],
    ),
  );
}

Widget widgettextValidadorFormulario(bool estado) {
  return estado != true
      ? espaciado(0, 0)
      : Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(top: 10, bottom: 5, left: 20),
          child: Text(
            stringCampoRequerido,
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
  return


    Container(

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
      image:  MemoryImage(base64Decode(urlFoto) ),
     // fit: BoxFit.cover,
    ),


  );
}

Widget widgetItemFiltro1(String texto, bool estado) {
  return Container(
    color: estado != true ? colorPrimario : Colors.white,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        espaciado(10, 0),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Text(
            texto,
            style: estiloTextoSpacing(
                12, estado != true ? Colors.white : colorPrimario, false),
          ),
        ),
        espaciado(10, 0),
        Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: widgetDivision()),
      ],
    ),
  );
}

Widget widgetItemFiltro2(String texto, bool filtro) {
  return Container(
    padding: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      border: Border.all(color: filtro != true ? colorPrimario : Colors.white),
      borderRadius: BorderRadius.all(
          Radius.circular(15) //                 <--- border radius here
          ),
    ),
    child: Text(
      texto,
      style: estiloTextoSpacing(10, Colors.white, false),
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
                  iconSvgColor(url, 32, 32, colorPrimario),
                  espaciado(0, 10),
                  Text(
                    texto,
                    style: estiloTextoSpacingFont1(16, colorPrimario, true),
                  ),
                  Expanded(child: SizedBox()),
                ],
              ),
            )),
      ),
    ],
  );
}

Widget widgetIconCheckSi(String urlIcon, String titulo, Color colorPrimario) {
  return Container(
    //height: 40,
   // margin: EdgeInsets.only(left: 5),

    child: Column(
      children: [
        espaciado(5, 0),
        Container(
          child: Row(
            children: [
              espaciado(0, 10),
              iconSvgColor(urlIcon, 21, 21, Colors.white),
              espaciado(0, 10),
              Text(titulo, style: estiloTexto(15, Colors.white, false)),
              //  espaciado(0, 8),
              espaciado(0, 10),
            ],
          ),
        ),
        espaciado(4, 0),
      ],
    ),
    decoration: BoxDecoration(
      color: colorPrimario,
      borderRadius:
          new BorderRadius.vertical(top: new Radius.elliptical(10, 10)),
    ),
  );
}

Widget widgetIconCheck(String urlIcon, String titulo, Color colorPrimario) {
  return Container(
    //height: 40,
   // margin: EdgeInsets.only(left: 5),

    child: Column(
      children: [
        espaciado(5, 0),
        Container(
          child: Row(
            children: [
              espaciado(0, 10),
              iconSvgColor(urlIcon, 21, 21, colorPrimario),
              espaciado(0, 10),
              Text(titulo, style: estiloTexto(15, colorPrimario, false)),
              espaciado(0, 10),
            ],
          ),
        ),
        espaciado(4, 0),
      ],
    ),
    decoration: BoxDecoration(
      //color: Colors.white,
      borderRadius:
          new BorderRadius.vertical(top: new Radius.elliptical(10, 10)),
    ),
  );
}

Widget widgetIconCheck2(
    String urlIcon, String titulo, String texto2, Color colorPrimario) {
  return Row(
    children: [
      espaciado(0, 10),
      iconSvgColor(urlIcon, 30, 30, colorPrimario),
      espaciado(0, 10),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titulo, style: estiloTexto(18, colorPrimario, true)),
          Text(texto2, style: estiloTexto(10, colorPrimario, true)),
        ],
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

Widget widgetOpcionesRelojes(String urlIcon) {
  return Container(
    child: Image.asset(
      "assets/images/relog/rolex1.png",
      height: 80,
    ),
    height: 100,
    decoration: BoxDecoration(
      color: colorRelojesFondo,
      borderRadius: BorderRadius.all(Radius.circular(10) //
          //        <--- border radius here
          ),
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
Widget widgetOpcionesAgregarFotoPrincipal(File file) {
  return Container(
    width: 100,
    child: file == null


        ?  Container(
       margin: EdgeInsets.all(30),
        child: iconSvgColor("assets/images/icon/iconClockPrincipal.svg",20,20,colorPrimario))
        : ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.file(
        file,
        height: 80,
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
Widget widgetOpcionesAgregarFoto(File file) {
  return Container(
    width: 100,
    child: file == null
        ? Icon(
            Icons.add,
            color: colorPrimario,
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.file(
              file,
              height: 80,
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

Widget widgetOpcionesRelojesImagen(File file) {
  return Container(
    child: file == null
        ? Image.asset(
            "assets/images/relog/rolex1.png",
            height: 80,
          )
        : Image.file(
            file,
            height: 80,
          ),
    height: 100,
    decoration: BoxDecoration(
      color: colorRelojesFondo,
      borderRadius: BorderRadius.all(Radius.circular(10) //
          //        <--- border radius here
          ),
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

Widget widgetBotonOpciones(String texto) {
  return Container(
    height: 50,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
            Radius.circular(10) //         <--- border radius here
            ),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [colorDegradado1, colorDegradado2])),
    child: Center(
      child: Text(
        texto,
        textAlign: TextAlign.center,
        style: estiloTexto(14, Colors.white, false),
      ),
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
      Expanded(child: SizedBox(),),
      Text(
       titulo.toUpperCase(),
        style: estiloTextoSpacingFont1(titulo == stringRecuperarClavetxt?18:23, Colors.white, false),
      ),
      Expanded(child: SizedBox(),),
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
              " "+stringNoResultados,
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

Widget widgetBotonRenovacion() {
  return Container(
    padding: EdgeInsets.only(left: 3, right: 3, top: 3, bottom: 3),
    child: Row(
      children: [
        espaciado(0, 5),
        Icon(
          Icons.update,
          color: Colors.white,
        ),
        espaciado(0, 5),
        Text(stringRenovar2 + "  ", style: estiloTexto(11, Colors.white, true)),
      ],
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: colorPrimario,
    ),
  );
}

Widget widgetItemCompartirDatos(String titulo1, String titulo2, int fuente) {
  return Container(
    margin: EdgeInsets.only(top: 10),
    child: GestureDetector(
      onTap: () {
        if (fuente == 2) {
          funcionLLamarNumero(titulo2);
        }
        if (fuente == 3) {
          funcionEnviarEmail(titulo2);
        }
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titulo1.toString() + ": ",
              style: estiloTexto(15, colorTexto, true)),
          espaciado(10, 0),
          Text(titulo2.toString(), style: estiloTexto(15, colorTexto, false)),
        ],
      ),
    ),
  );
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

Widget buttonStyleIconCheck(
    var color, String texto, double sizeText, var colorText) {
  return Container(
    decoration: new BoxDecoration(
      color: color,
      borderRadius: new BorderRadius.all(Radius.circular(25)),
      boxShadow: [
        BoxShadow(
          color: colorPrincipal.withOpacity(0.3),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    child: Center(
        child: Row(
      children: [
        Expanded(child: SizedBox()),
        Text(
          texto,
          style: TextStyle(
              fontSize: sizeText,
              color: colorText,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0),
        ),
        espaciado(20, 0),
        Container(
          width: 32,
          height: 32,
          child: Icon(
            Icons.check,
            size: 30,
            color: colorPrincipal,
          ),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        ),
        Expanded(child: SizedBox()),
      ],
    )),
  );
}

Widget buttonStyleIcon(
    var color, String texto, double sizeText, var colorText) {
  return Container(
    decoration: new BoxDecoration(
      color: color,
      borderRadius: new BorderRadius.all(Radius.circular(25)),
      boxShadow: [
        BoxShadow(
          color: colorPrincipal.withOpacity(0.3),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    child: Center(
        child: Row(
      children: [
        Expanded(child: SizedBox()),
        Text(
          texto,
          style: TextStyle(
              fontSize: sizeText,
              color: colorText,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0),
        ),
        espaciado(20, 0),
        Container(
          width: 32,
          height: 32,
          child: Icon(
            Icons.arrow_forward,
            size: 30,
            color: colorPrincipal,
          ),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        ),
        Expanded(child: SizedBox()),
      ],
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

Widget widgetBotonOpcionesNoOpciones(String texto) {
  return Container(
    height: 50,
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: 5,
        blurRadius: 10,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ], color: Colors.white),
    child: Center(
      child: Text(
        texto,
        textAlign: TextAlign.center,
        style: estiloTexto(16, colorTexto, false),
      ),
    ),
  );
}

Widget widgetBotonOpcionesNoOpcionesIcon() {
  return Container(
    height: 50,
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: 5,
        blurRadius: 10,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ], color: Colors.white),
    child: Center(
      child: iconSvgColor(
          "assets/images/icon/Icons-21.svg", 40, 40, colorTextoOpacidad),
    ),
  );
}

Widget widgetBotonOpcionesSiOpcionesIcon() {
  return Container(
    height: 50,
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: 5,
        blurRadius: 10,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ], color: colorPrimario),
    child: Center(
      child:
          iconSvgColor("assets/images/icon/Icons-21.svg", 40, 40, Colors.white),
    ),
  );
}

Widget widgetBotonOpcionesSiOpciones(String texto) {
  return Container(
    height: 50,
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: 5,
        blurRadius: 10,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ], color: colorPrimario),
    child: Center(
      child: Text(
        texto,
        textAlign: TextAlign.center,
        style: estiloTexto(16, Colors.white, false),
      ),
    ),
  );
}

Widget widgetBotonOpcionesNo(String texto) {
  return Container(
    height: 50,
    decoration: BoxDecoration(
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
        color: Colors.white),
    child: Center(
      child: Text(
        texto,
        textAlign: TextAlign.center,
        style: estiloTexto(14, colorTexto, false),
      ),
    ),
  );
}
