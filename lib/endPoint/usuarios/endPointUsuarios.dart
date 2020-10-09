import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testquick/models/modelUsuario.dart';
import 'package:testquick/widget/card/cardInicio.dart';
import 'package:testquick/widget/card/cardItemChat.dart';
import 'package:testquick/widget/widget.dart';

Widget endPointListaUsuarios(
    BuildContext context, int vista, String filtroUsuario) {
  return StreamBuilder(
    stream: Firestore.instance.collection('usuarios').snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) return espaciado(0, 0);

      return snapshot.data.documents.length == 0
          ? widgetMisFavoritos(context)
          : Container(
              height: 200,
              // margin: EdgeInsets.only(left: 10, right: 10),
              child: ListView.builder(
                  scrollDirection: vista == 1 ? Axis.horizontal : Axis.vertical,
                  // physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (BuildContext context, int i) {
                    modelUsuario data = new modelUsuario(
                      snapshot.data.documents[i]["id"].toString() == "null"
                          ? snapshot.data.documents[i]["id"].toString()
                          : "",
                      snapshot.data.documents[i]["uid"],
                      snapshot.data.documents[i]["nombreCompleto"] != "null"
                          ? " " +
                              snapshot.data.documents[i]["nombreCompleto"]
                                  .toString()
                          : "",
                      snapshot.data.documents[i]["email"] != "null"
                          ? snapshot.data.documents[i]["email"].toString()
                          : "",
                      snapshot.data.documents[i]["tel"] != "null"
                          ? snapshot.data.documents[i]["tel"].toString()
                          : "",
                      snapshot.data.documents[i]["foto"].toString(),
                      snapshot.data.documents[i]["descripcionPerfil"]
                                  .toString() !=
                              "null"
                          ? snapshot.data.documents[i]["descripcionPerfil"]
                              .toString()
                          : "",
                      snapshot.data.documents[i]["tokem"].toString(),
                    );
                    if (filtroUsuario.toString().trim().length != 0) {

                      if (data.nombreCompleto.toLowerCase().contains(
                              filtroUsuario.toString().toLowerCase()) ==
                          true) {
                        switch (vista) {
                          case 1:
                            return widgetCardChat(context, data);
                            break;
                          case 2:
                            return cardItemChat(context, data);
                            break;
                        }
                      }
                    } else {

                      switch (vista) {
                        case 1:
                          return widgetCardChat(context, data);
                          break;
                        case 2:
                          return cardItemChat(context, data);
                          break;
                      }
                    }
                  }),
            );
    },
  );
}
