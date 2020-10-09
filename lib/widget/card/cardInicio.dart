import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testquick/color/color.dart';
import 'package:testquick/endPoint/chat/endPointChat.dart';
import 'package:testquick/models/modelUsuario.dart';
import 'package:testquick/string/string.dart';
import 'package:testquick/utils/routes/routes.dart';
import 'package:testquick/utils/style.dart';
import 'package:testquick/widget/widget.dart';

Widget widgetCardChat(BuildContext context, modelUsuario data) {
  return GestureDetector(
    onTap: () {
      endPointConsultarChat(data.uid).then((value) {
        if (value != false) {
          routesChatUsuario(context, value, data);
        } else {
          flusbarMensaje(
              notificacionString, errorNotificacionString, Colors.red, context);
        }
      });
    },
    child: Container(
      margin: EdgeInsets.only(left: 15),
      child: Stack(
        children: [
          Container(
            width: 150,
            height: 200,
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Colors.transparent,
                  colorFondo
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, 0.3, 0.7, 1],
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: widgetImage(
                data.foto,
                150,
                200,
              ),
            ),
          ),
          Positioned.fill(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          data.nombreCompleto,
                          style: estiloTexto(17, Colors.white, true),
                        ),
                        espaciado(10, 0),
                        Text(data.email,
                            style: estiloTexto(13, Colors.white, false))
                      ],
                    ),
                  ))),
        ],
      ),
    ),
  );
}
