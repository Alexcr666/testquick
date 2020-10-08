import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testquick/color/color.dart';
import 'package:testquick/models/modelUsuario.dart';
import 'package:testquick/sharedPreferences/sharedPreferences.dart';
import 'package:testquick/string/string.dart';
import 'package:testquick/utils/routes/routes.dart';
import 'package:testquick/utils/style.dart';
import 'package:testquick/utils/utils.dart';
import 'package:testquick/widget/widget.dart';



final databaseReference = Firestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;
String uidUser = "";
String idDocumentoUser = "";

String fechaFinal = "";
bool sinLogin = false;
int estadoLogin = 0;

Future endPointCambiarClaveSi(
    BuildContext context, String claveAntigua, String claveNueva) async {
  //Create an instance of the current user.
  FirebaseUser user = await FirebaseAuth.instance.currentUser();
  AuthResult result = await auth
      .signInWithEmailAndPassword(email: user.email, password: claveAntigua)
      .then((value) {
    user.updatePassword(claveNueva).then((value) {
      flusbarMensaje(
          notificacionString, claveCambiadaExitosamente, Colors.blue, context);
    }).catchError((error) {
      print(error.toString());
      flusbarMensaje(notificacionString, claveErrorString, Colors.red, context);
      //This might happen, when the wrong password is in, the user isn't found, or if the user hasn't logged in recently.
    });
  }).catchError((onError) {
    flusbarMensaje(
        notificacionString, claveActualIncorrectaString, Colors.red, context);
  });
  //Pass in the password to updatePassword.
}

Future getAuth() async {
  final FirebaseUser user = await auth.currentUser();
  uidUser = user.uid.toString();
}

Future endPointActualizarTokenUsuario(
    BuildContext context, String token) async {
  databaseReference.collection('usuarios').document(uidUser).updateData({
    'tokem': token,
  }).then((value) {
    // flusbarMensaje(
    //   notificacionString, stringOperacionExitosa, colorPrincipal, context);
  }).catchError((onError) {
    flusbarMensaje(
        notificacionString, datosIconrrectosString, Colors.red, context);
  });
}

Future endPointActualizarIntroducionUsuario(String titulo, bool estado) async {

  databaseReference
      .collection('usuarios')
      .document(uidUser)
      .collection("introducion")
  .document(titulo)
      .setData({
        "valor": estado,
      })
      .then((value) {})
      .catchError((onError) {});
}

Future endpointEditarUsuario(
  BuildContext context,
  String nombreCompleto,
  String celular,
  String correo,
  String descripcionPerfil,
  String direccion,
  String empresa,
  String tiempo,
  bool imagen,
  String imagenRuta,
) async {
//  Firestore.instance.enablePersistence(true);

  showProgressGlobal(context, true);

  if (imagen == true) {
    databaseReference.collection('usuarios').document(uidUser).updateData({
      'nombreCompleto': nombreCompleto,
      'email': correo,
      'tel': celular,
      'empresa': empresa,
      'direccion': direccion,
      'fechaNacimiento': tiempo,
      'foto': imagenRuta,
      'descripcionPerfil': descripcionPerfil,
    }).then((value) {
      showProgressGlobal(context, false);
      flusbarMensaje(notificacionString, stringPerfilActualizado,
          colorPrimario, context);
      // flusbarMensaje(
      //   notificacionString, stringOperacionExitosa, colorPrincipal, context);
    }).catchError((onError) {
      showProgressGlobal(context, false);
      flusbarMensaje(
          notificacionString, datosIconrrectosString, Colors.red, context);
    });
  } else {
    databaseReference.collection('usuarios').document(uidUser).updateData({
      'nombreCompleto': nombreCompleto,
      'email': correo,
      'empresa': empresa,
      'fechaNacimiento': tiempo,
      'direccion': direccion,
      'descripcionPerfil': descripcionPerfil,
      'tel': celular,
    }).then((value) {
      showProgressGlobal(context, false);
      flusbarMensaje(notificacionString, datosIngresadosCorrectamenteString,
          Colors.blue, context);
    }).catchError((onError) {
      showProgressGlobal(context, false);
      flusbarMensaje(
          notificacionString, datosIconrrectosString, Colors.red, context);
    });
  }
  funcionVerificarConexionNoMensaje(context).then((value) {
    if (value == false) {
      showProgressGlobal(context, false);
      flusbarMensaje(notificacionString, datosIngresadosCorrectamenteString,
          Colors.blue, context);
    }
  });
}

Future endpointEditarUsuarioMetodoPago(
    BuildContext context, String metodoPago) async {
  CollectionReference ref = Firestore.instance.collection('usuarios_app');
  QuerySnapshot eventsQuery =
      await ref.where('uid', isEqualTo: uidUser).getDocuments();
  eventsQuery.documents.forEach((msgDoc) {
    msgDoc.reference.updateData({
      'metodoPago': metodoPago,
    }).then((value) {
      //flusbarMensaje(notificacionString, datosIngresadosCorrectamenteString,
      //  Colors.blue, context);
    });
  });
}
Future<bool> endPointConsultarIntroducionUsuario(String titulo) async {
  DocumentReference userReference =
  databaseReference.collection('usuarios').document(uidUser).collection("introducion").document(titulo);
  DocumentSnapshot userRef = await userReference.get();
return userRef.exists;



}
Future<modelUsuario> endPointUsuario() async {
  DocumentReference userReference =
      databaseReference.collection('usuarios').document(uidUser);

  DocumentSnapshot userRef = await userReference.get();

  modelUsuario model = new modelUsuario(
    userRef.data["id"].toString() == "null"
        ? userRef.data["id"].toString()
        : "",
    userRef.data["uid"],
    userRef.data["nombreCompleto"] != "null"
        ? userRef.data["nombreCompleto"].toString()
        : "",
    userRef.data["email"] != "null" ? userRef.data["email"].toString() : "",
    userRef.data["tel"] != "null" ? userRef.data["tel"].toString() : "",
    userRef.data["foto"].toString(),
    userRef.data["descripcionPerfil"].toString() != "null"
        ? userRef.data["descripcionPerfil"].toString()
        : "",
    userRef.data["direccion"].toString() != "null"
        ? userRef.data["direccion"].toString()
        : "",
    userRef.data["empresa"].toString() != "null"
        ? userRef.data["empresa"].toString()
        : "",
    userRef.data["fechaNacimiento"].toString() != "null"
        ? userRef.data["fechaNacimiento"].toString()
        : "MM/DD/YYYY",
    userRef.data["tokem"].toString(),
  );

  return model;
}

Future<modelUsuario> endPointUsuario2(String uid) async {
  Query userReference =
      databaseReference.collection('usuarios').where("uid", isEqualTo: uid);

  QuerySnapshot userRef = await userReference.getDocuments();

  modelUsuario model = new modelUsuario(
    userRef.documents[0]["id"].toString() == "null"
        ? userRef.documents[0]["id"].toString()
        : "",
    userRef.documents[0]["uid"],
    userRef.documents[0]["nombreCompleto"] != "null"
        ? " " + userRef.documents[0]["nombreCompleto"].toString()
        : "",
    userRef.documents[0]["email"] != "null"
        ? userRef.documents[0]["email"].toString()
        : "",
    userRef.documents[0]["tel"] != "null"
        ? userRef.documents[0]["tel"].toString()
        : "",
    userRef.documents[0]["foto"].toString(),
    userRef.documents[0]["descripcionPerfil"].toString() != "null"
        ? userRef.documents[0]["descripcionPerfil"].toString()
        : "",
    userRef.documents[0]["direccion"].toString() != "null"
        ? userRef.documents[0]["direccion"].toString()
        : "",
    userRef.documents[0]["empresa"].toString() != "null"
        ? userRef.documents[0]["empresa"].toString()
        : "",
    userRef.documents[0]["fechaNacimiento"].toString() != "null"
        ? userRef.documents[0]["fechaNacimiento"].toString()
        : "MM/DD/YYYY",
    userRef.documents[0]["tokem"].toString(),
  );

  return model;
}

Future verificarLogin() async {
  return FirebaseAuth.instance.currentUser().then((firebaseUser) {
    if (firebaseUser != null) {
      uidUser = firebaseUser.uid;
      return true;

      //signed out
    } else {
      return false;

      //signed in
    }
  });
}

Widget endPointUserAuth(BuildContext context, String idDocumento) {
  return StreamBuilder(
    stream: Firestore.instance
        .collection('usuarios')
        .where("uid", isEqualTo: idDocumento)
        .snapshots(),
    builder: (context, snapshot) {
      print("resultados usuario" +
          snapshot.data.documents.length.toString() +
          " : $idDocumento");
      if (!snapshot.hasData) return Text("No data");
      modelUsuario data = new modelUsuario(
        snapshot.data.documents[0]["id"].toString(),
        snapshot.data.documents[0]["uid"].toString(),
        snapshot.data.documents[0]["nombreCompleto"].toString(),
        snapshot.data.documents[0]["email"].toString(),
        snapshot.data.documents[0]["tel"].toString(),
        snapshot.data.documents[0]["foto"].toString(),
        snapshot.data.documents[0]["descripcionPerfil"].toString(),
        snapshot.data.documents[0]["direccion"].toString(),
        snapshot.data.documents[0]["empresa"].toString(),
        snapshot.data.documents[0]["fechaNacimiento"].toString(),
        snapshot.data.documents[0]["token"].toString(),
      );
      return Column(
        children: [
          espaciado(0, 20),
          Row(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      margin: EdgeInsets.only(bottom: 60, left: 20),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Center(
                          child: Icon(
                        Icons.arrow_back,
                        color: colorGrisIconos,
                        size: 25,
                      )))),
              Expanded(child: SizedBox()),
              Container(
                height: 115,
                width: 115,
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(data.foto.toString() != "null"
                      ? data.foto.toString()
                      : 'https://via.placeholder.com/150'),
                  backgroundColor: Colors.transparent,
                ),
              ),
              Expanded(child: SizedBox()),
              espaciado(65, 0),
            ],
          ),
          espaciado(0, 20),
          Container(
              alignment: Alignment.center,
              child: Text(
                data.nombreCompleto,
                style: estiloTexto(30, colorPrincipal, false),
              )),
        ],
      );
    },
  );
}

Future<FirebaseUser> authLogueo(
    BuildContext context, String email, String password) async {
  try {
    AuthResult result =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    final FirebaseUser user = result.user;

    assert(user != null);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await auth.currentUser();
    assert(user.uid == currentUser.uid);
    uidUser = currentUser.uid;
    //  print('signInEmail succeeded: $user');
    guardarSession(uidUser);
    showProgressGlobal(context, false);

      routesInicio(context);



    return user;
  } catch (e) {
    print(e.toString());
    showProgressGlobal(context, false);
    //  showProgressGlobal(context, false);
    flusbarMensaje(
        notificacionString, datosIconrrectosString, Colors.red, context);

    return null;
  }
}

@override
Future<void> resetPassword(BuildContext context, String email) async {
  await auth.sendPasswordResetEmail(email: email);
}

Future resetEmail(String newEmail) async {
  var message;
  FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();
  firebaseUser.updateEmail(newEmail).then((value) {
    print("cambiado email");
  }).catchError((e) {
    print("error email");
  });
}

Future funcionDeslogueo(BuildContext context) async {
  guardarSession(null);
  verificarLogin().then((value) {
    if (value == true) {
      // loginAceptar = true;

      auth.signOut().then((value) {
        routesLogin(context);
      });
    } else {
      auth.signOut().then((value) {
        routesLogin(context);
      });
    }
  });
}

Future<FirebaseUser> authRegistro(BuildContext context, email, password) async {
  showProgressGlobal(context, true);
  try {
    AuthResult result = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    final FirebaseUser user = result.user;

    assert(user != null);
    assert(await user.getIdToken() != null);

    showProgressGlobal(context, false);
    return user;
  } catch (e) {
    showProgressGlobal(context, false);
    if (password.toString().length <= 5) {
      flusbarMensaje(notificacionString, claveMenor, Colors.red, context);
    }
    return null;
  }
}
