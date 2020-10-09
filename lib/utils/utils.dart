import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:testquick/string/string.dart';
import 'package:testquick/widget/widget.dart';
import 'package:url_launcher/url_launcher.dart';

funcionAtras(context) {
  Navigator.pop(context);
}
funcionPermisos() async {
  if (await Permission.contacts.request().isGranted) {
  // Either the permission was already granted before or the user just granted it.
  }

// You can request multiple permissions at once.
  Map<Permission, PermissionStatus> statuses = await [
  Permission.storage,
  Permission.microphone,
  ].request();
}

String convertirTexto(String encoded) {
  List<int> bytes = encoded.toString().codeUnits;
  return utf8.decode(bytes);
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

Future convertBase64(File file) async {
  var result = await FlutterImageCompress.compressWithFile(
    file.absolute.path,
    minWidth: 500,
    minHeight: 500,
    quality: 50,
    // rotate: 90,
  );
  print(result.toString());
  print(result.length);

  return base64Encode(result);
  List<int> imageBytes = await file.readAsBytes();
  print(imageBytes);

  return base64Encode(imageBytes);
}

Future funcionVerificarConexion(BuildContext context) async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    flusbarMensaje(notificacionString, noConexionInternet, Colors.red, context);
    return false;
  }
}

Future funcionVerificarConexionNoMensaje(BuildContext context) async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
}

funcionSalirAlerta(BuildContext context) {
  Navigator.of(context).pop();
}

funcionFechaWidget(bool estado, String horaInicio, String horaFinal) {
  return estado == false
      ? "Cerrado"
      : horaInicio + " - " + horaFinal + " PM".toString();
}

String printDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
}

funcionAbrirUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

funcionEnviarEmail(String email) {
  final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {'subject': 'Example Subject'});
  launch(_emailLaunchUri.toString());
}

bool isEmail(String em) {
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = new RegExp(p);

  return regExp.hasMatch(em);
}

Future<void> sendNotification(String titulo, mensaje, token) async {
  var postUrl = "https://fcm.googleapis.com/fcm/send";

  final data = {
    "notification": {"body": mensaje, "title": titulo},
    "priority": "high",
    "data": {
      "click_action": "FLUTTER_NOTIFICATION_CLICK",
      "id": "1",
      "status": "done"
    },
    "to": "$token"
  };

  final headers = {
    'content-type': 'application/json',
    'Authorization':
        'key=AAAAr8aYeyA:APA91bH7344Kx4kcuXW57aH8geZg60ZdVtEDPXak4H-60pHgvnIhfJAYiajNQ0ff8CB9ktraTh5ibT_NUnHenuowgo8RSA_UJew9kQ8_OJSXVyxVxnWX0p5t0daKdAME-bvluRNXPl0V'
  };

  BaseOptions options = new BaseOptions(
    //connectTimeout: 5000,
    //receiveTimeout: 3000,
    headers: headers,
  );

  try {
    final response = await Dio(options).post(postUrl, data: data);
    print(response.data);
    print(response.statusMessage);

    if (response.statusCode == 200) {
      print("prueba22");
      // Fluttertoast.showToast(msg: 'Request Sent To Driver');
    } else {
      print('notification sending failed');
      // on failure do sth
    }
  } catch (e) {
    print('exception prueba $e');
  }
}
