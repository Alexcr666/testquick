import 'package:flutter/material.dart';
import 'package:testquick/color/color.dart';
import 'package:testquick/endPoint/usuarios/endPointUsuarios.dart';
import 'package:testquick/string/string.dart';
import 'package:testquick/utils/style.dart';
import 'package:testquick/widget/card/cardInicio.dart';
import 'package:testquick/widget/card/cardItemChat.dart';
import 'package:testquick/widget/widget.dart';
import 'package:flutter/services.dart';
class screenChats extends StatefulWidget {
  @override
  _screenChatsState createState() => _screenChatsState();
}

class _screenChatsState extends State<screenChats> {


  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      backgroundColor: colorFondo,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xff7747f3),
              Color(0xff48a9f2),
            ],
          ),
          // borderRadius: BorderRadius.all(Radius.circular(80.0))
        ),
        child: ListView(
          children: <Widget>[
            espaciado(40, 0),
            Padding(
              padding: EdgeInsets.only(left: 40.0),
              child: Row(
                children: <Widget>[
                  Text(stringChats,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0)),
                  SizedBox(width: 10.0),
                ],
              ),
            ),
            espaciado(20, 0),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20),
              child: TextFormField(
                  validator: (value) {
                    if (value.trim().isEmpty) {
                      return favordigitarelcampoString;
                    }
                    return null;
                  },
                  style: estiloTextoSpacingFont4(15, Colors.white, true),

                  textInputAction: TextInputAction.go,
                  decoration: estiloCampoTextoSearch(
                      stringTelefono)),
            ),

            SizedBox(height: 10.0),
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: colorFondo,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
              ),
              child:   endPointListaUsuarios(context,2),
            )
          ],
        ),
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

}
