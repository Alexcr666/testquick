import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testquick/auth/auth.dart';
import 'package:testquick/color/color.dart';
import 'package:testquick/string/string.dart';
import 'package:testquick/utils/utils.dart';
import 'package:testquick/widget/widget.dart';

class screenRecuperarClave extends StatefulWidget {
  @override
  _screenRecuperarClaveState createState() => _screenRecuperarClaveState();
}

final _formKeyRecuperar = GlobalKey<FormState>();
final _controllerEmailRecuperar = TextEditingController();

class _screenRecuperarClaveState extends State<screenRecuperarClave> {
  int _correo = 0;

  actualizar() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/image/relojApp.jpg"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // resizeToAvoidBottomPadding: false,
        body: Stack(
          children: [
           /* Image.asset(
              "assets/images/image/relojApp.jpg",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),*/
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black.withOpacity(0.6),
            ),
            Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          espaciado(30, 0),
                          widgetCabezera(context, stringRecuperarClavetxt),
                          espaciado(60, 0),
                          Form(
                            key: _formKeyRecuperar,
                            child: Column(
                              children: [
                                TextFormField(
                                    style: TextStyle(color: Colors.white),
                                    inputFormatters: [
                                      new WhitelistingTextInputFormatter(RegExp(
                                          "[a-zA-Zá-úÁ-Ú0-9._,+#=¿?*/@-]")),
                                    ],
                                    controller: _controllerEmailRecuperar,
                                    decoration: InputDecoration(
                                      //border: BorderSide.none,
                                      hintText: stringCorreo,
                                      border: InputBorder.none,

                                      hintStyle:
                                          TextStyle(color: Colors.grey[400]),
                                      suffixIcon: _correo == 0
                                          ? SizedBox()
                                          : _correo != 1
                                              ? Transform.rotate(
                                                  angle: 40,
                                                  child: IconButton(
                                                    icon: Icon(
                                                      Icons.add_circle_outline,
                                                      color: colorRojoBoton,
                                                    ),
                                                  ),
                                                )
                                              : IconButton(
                                                  icon: Icon(
                                                    Icons.check_circle_outline,
                                                    color: colorVerde,
                                                  ),
                                                ),
                                    ),
                                    validator: (value) {
                                      if (value.trim().isEmpty) {
                                        return favordigitarelcampoString;
                                      }
                                      return null;
                                    }),
                                widgetDivider(),
                              ],
                            ),
                          ),
                          espaciado(30, 0),
                          espaciado(0, 25),
                          GestureDetector(
                              onTap: () {
                                if (_formKeyRecuperar.currentState.validate()) {
                                  if (isEmail(_controllerEmailRecuperar.text) ==
                                      true) {
                                    resetPassword(context,
                                            _controllerEmailRecuperar.text)
                                        .then((value) {
                                      alertOpcionesLogin(
                                          context,
                                          stringRevisaTuCorreoElectronico,
                                          "",
                                          "assets/images/header2png.png",
                                          1);
                                      flusbarMensaje(notificacionString,
                                          "Correo enviado", Colors.blue, context);
                                      // _controllerEmailRecuperar.clear();
                                    }).catchError((e) {
                                      flusbarMensaje(
                                          notificacionString,
                                          datosIconrrectosString,
                                          Colors.red,
                                          context);
                                    });
                                    _correo = 1;
                                  } else {
                                    flusbarMensaje(
                                        notificacionString,
                                        stringCondicion2CrearCuenta,
                                        Colors.red,
                                        context);
                                    _correo = 2;
                                  }
                                }

                                actualizar();
                              },
                              child: buttonApp(stringEnviar)),
                          espaciado(20, 0),

                          espaciado(0, 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    _controllerEmailRecuperar.clear();
    _correo = 0;
    actualizar();
  }
}
