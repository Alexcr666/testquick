import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testquick/endPoint/chat/endPointChat.dart';
import 'package:testquick/models/modelUsuario.dart';
import 'package:testquick/string/string.dart';
import 'package:testquick/utils/routes/routes.dart';
import 'package:testquick/utils/style.dart';
import 'package:testquick/widget/widget.dart';

Widget cardItemChat(BuildContext context, modelUsuario data) {
  return Container(
    margin: EdgeInsets.only(top: 20, left: 20),
    child: ListTile(
      onTap: () {
        endPointConsultarChat(data.uid).then((value) {
          if (value != false) {
            routesChatUsuario(context, value, data);
          } else {
            flusbarMensaje(notificacionString, errorNotificacionString,
                Colors.red, context);
          }
        });
      },
      title:
          Text(data.nombreCompleto, style: estiloTexto(22, Colors.white, true)),
      subtitle: Text(data.email, style: estiloTexto(18, Colors.white, false)),
      leading: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: widgetImage(data.foto, 60, 60)),
    ),
  );
}
