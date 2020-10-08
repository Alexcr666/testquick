
import 'package:shared_preferences/shared_preferences.dart';

Future sacarEstado() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getBool("check") != null) {
    return prefs.getBool("check");
  } else {
    return false;
  }
}

Future guardarRelojOffline(String url) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('foto1', url);

  print("guardo datos offline");
}

Future sacarRelojOffline() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getString("foto1") != null) {
    return prefs.getString("foto1");
  } else {
    return false;
  }
}

Future guardarEstado(bool estado) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  prefs.setBool('check', estado);
}
Future guardarIntroducion(String titulo) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  prefs.setBool(titulo, true);
}


Future sacarIntroducion(String titulo) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool(titulo) != null) {
      return prefs.getBool(titulo);
    } else {
      return false;
    }

}


Future guardarSession(String uid) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  prefs.setString('session', uid);
}

Future sacarSession() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getString("session") != null) {
    return prefs.getString("session");
  } else {
    return false;
  }
}

Future getDocumentoUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getString("idDocumentoUser") != null) {
    return prefs.getString("idDocumentoUser");
  } else {
    return false;
  }
}
