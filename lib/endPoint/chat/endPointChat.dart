import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testquick/auth/auth.dart';
import 'package:testquick/models/modelChat.dart';
import 'package:testquick/ui/screenChat/screenChat.dart';
import 'package:testquick/widget/card/cardItemChatImagen.dart';
import 'package:testquick/widget/card/cardItemChatTexto.dart';
import 'package:testquick/widget/widget.dart';

final databaseReference = Firestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;

Future endPointCrearChat(String idUser1, String idUser2) async {
  try {
    DocumentReference ref =
        await Firestore.instance.collection("chats").document();
    ref.setData({
      'idUser1': idUser1,
      'idUser2': idUser2,
    });

    return ref.documentID;
  } catch (e) {
    return false;
  }
}

Future endPointCrearMensaje(String idChat, String mensaje, int tipo) async {
  try {
    DocumentReference ref = await Firestore.instance
        .collection("chats")
        .document(idChat)
        .collection("mensajes")
        .document();
    ref.setData({
      'mensaje': mensaje,
      'id': ref.documentID,
      'idUsuario':uidUser,
      'tipo':tipo,
      'fecha': FieldValue.serverTimestamp(),
    });

    return ref.documentID;
  } catch (e) {
    return false;
  }
}

Future endPointConsultarChat(String idUsuario) async {
  Query querychat = databaseReference
      .collection('relojes')
      .where("idUser1", isEqualTo: uidUser)
      .where("idUser2", isEqualTo: idUsuario);

  QuerySnapshot data = await querychat.getDocuments();
  if (data.documents.length == 0) {
    Query querychat = databaseReference
        .collection('chats')
        .where("idUser2", isEqualTo: uidUser)
        .where("idUser1", isEqualTo: idUsuario);
    QuerySnapshot data = await querychat.getDocuments();
    if (data.documents.length == 0) {
      endPointCrearChat(uidUser, idUsuario).then((value) {
        if (value != false) {
          return value;
        } else {
          return false;
        }
      });
    } else {
      return data.documents[0].documentID;
    }
  } else {
    return data.documents[0].documentID;
  }
}

Widget endPointListaMensajes(BuildContext context, String idChat) {
  return StreamBuilder(
    stream: Firestore.instance
        .collection('chats')
        .document(idChat)
        .collection("mensajes")
        .orderBy('fecha', descending: true)
        .snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) return espaciado(0, 0);

      return snapshot.data.documents.length == 0
          ? widgetMisFavoritos(context)
          : Container(

              // margin: EdgeInsets.only(left: 10, right: 10),
              child: ListView.builder(
                reverse: true,
                  controller: controllerListaChat,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (BuildContext context, int i) {
                    modelChat data = new modelChat(
                      snapshot.data.documents[i]["mensaje"],
                      snapshot.data.documents[i]["id"],
                      snapshot.data.documents[i]["tipo"],
                      snapshot.data.documents[i]["idUsuario"],
                      snapshot.data.documents[i]["fecha"],
                    );
                    switch(data.tipo){
                      case 1:
                        return cardItemChatTexto(context, data);
                        break;
                      case 2:
                        return cardItemChatImagen(context, data);
                        break;
                      case 3:
                        break;
                    }


                  }),
            );
    },
  );
}
