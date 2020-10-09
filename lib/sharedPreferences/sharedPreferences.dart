import 'package:shared_preferences/shared_preferences.dart';




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
