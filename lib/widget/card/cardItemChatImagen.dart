import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:testquick/auth/auth.dart';
import 'package:testquick/color/color.dart';
import 'package:testquick/models/modelChat.dart';
import 'package:testquick/utils/style.dart';
import 'package:testquick/widget/widget.dart';

Widget cardItemChatImagen(BuildContext context, modelChat data) {
  String formattedDate = "";
  //data.toString();
  if (data.fecha.toString() != "null") {
    formattedDate =
        DateFormat('yyyy-MM-dd – kk:mm').format(data.fecha.toDate());
  }
  return Container(
      alignment: data.idUsuario == uidUser
          ? Alignment.centerLeft
          : Alignment.centerRight,
      // width: 40,
      // height: 100,
      // padding: EdgeInsets.only(right: 10),
      // OR
      margin: EdgeInsets.only(left: 150, top: 10),
      decoration: estiloRedondeado(
          data.idUsuario == uidUser ? colorMensajeUser2 : colorBlancoOpacidad,
          50),
      child: Container(
        margin: EdgeInsets.only(right: 20, left: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            espaciado(3, 0),
            Container(
                margin: EdgeInsets.only(top: 10, left: 20, bottom: 10),
                alignment: Alignment.centerLeft,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: widgetImage(data.mensaje, 120, 120))),
            espaciado(5, 0),
            Container(
                margin: EdgeInsets.only(right: 20),
                alignment: Alignment.centerRight,
                child: Text(formattedDate.toString(),
                    style: estiloTexto(13, Colors.white, false))),
            espaciado(3, 0),
          ],
        ),
      ));
}
