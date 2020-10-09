import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:testquick/auth/auth.dart';
import 'package:testquick/color/color.dart';
import 'package:testquick/models/modelChat.dart';
import 'package:testquick/utils/style.dart';
import 'package:testquick/widget/widget.dart';

Widget cardItemChatAudio(BuildContext context, modelChat data) {
  funcionReproducirAudio(String url) async {
    AudioPlayer audioPlayer = new AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);

    int result = await audioPlayer.play(url);
    if (result == 1) {
      print("success");
      // success
    } else {
      print("error");
    }
  }

  String formattedDate = "";
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
          100),
      child: Container(
        margin: EdgeInsets.only(right: 20, left: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            espaciado(3, 0),
            GestureDetector(
              onTap: () {
                funcionReproducirAudio(data.mensaje);
              },
              child: Container(
                  decoration: estiloRedondeado(Colors.white, 100),
                  alignment: Alignment.centerLeft,
                  child: Icon(Icons.play_arrow)),
            ),
            espaciado(5, 0),
            Container(
                alignment: Alignment.centerRight,
                child: Text(formattedDate.toString(),
                    style: estiloTexto(12, Colors.white, false))),
            espaciado(3, 0),
          ],
        ),
      ));
}
