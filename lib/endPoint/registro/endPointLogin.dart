import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:testquick/auth/auth.dart';

final databaseReference = Firestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;

Future endPointCrearUsuario(var context, String email, String nombres,
    String uid, String celular) async {
  try {
    DocumentReference ref =
        await Firestore.instance.collection("usuarios").document(uid);
    ref.setData({
      'email': email,
      'nombreCompleto': nombres,
      'uid': uid,
      'tel': celular,
    });

    return true;
  } catch (e) {
    return false;
  }
}
