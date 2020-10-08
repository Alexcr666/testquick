import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:image_picker/image_picker.dart';

import 'package:testquick/auth/auth.dart';
import 'package:testquick/color/color.dart';
import 'package:testquick/string/string.dart';
import 'package:testquick/utils/style.dart';
import 'package:testquick/utils/utils.dart';
import 'package:testquick/widget/widget.dart';

class screenCambiarClave extends StatefulWidget {
  @override
  _screenCambiarClaveState createState() => _screenCambiarClaveState();
}

final _formKeyTarjeta = GlobalKey<FormState>();
bool passwordVisibleActual = true;
bool passwordVisibleNueva = true;
bool passwordVisibleConfirma = true;

final _controllerClaveAntigua = TextEditingController();
final _controllerClaveNueva = TextEditingController();
final _controllerClaveConfirmar = TextEditingController();

class _screenCambiarClaveState extends State<screenCambiarClave> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    return Scaffold(
        backgroundColor: colorFondo,
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Form(
                    key: _formKeyTarjeta,
                    child: Container(
                      child: Column(
                        children: [
                          // Container(child:),
                          espaciado(40, 0),

                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  funcionAtras(context);
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  size: 30,
                                  color: colorPrimario,
                                ),
                              ),
                              Expanded(child: SizedBox()),
                              GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    stringCambiarClave,
                                    style: estiloTexto(20, colorPrimario, true),
                                  )),
                              espaciado(0, 40),
                              Expanded(child: SizedBox()),
                            ],
                          ),
                          espaciado(40, 0),

                          new TextFormField(
                              style: estiloTextoSpacingFont4(
                                  17, Colors.white, true),
                              textInputAction: TextInputAction.go,
                              inputFormatters: [
                                new WhitelistingTextInputFormatter(
                                    RegExp("[a-zA-Zá-úÁ-Ú0-9._,+#=¿?*/@-]")),
                                LengthLimitingTextInputFormatter(100),
                              ],
                              obscureText: passwordVisibleActual,
                              controller: _controllerClaveAntigua,
                              decoration: new InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    passwordVisibleActual
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Theme.of(context).primaryColorDark,
                                  ),
                                  onPressed: () {
                                    // Update the state i.e. toogle the state of passwordVisible variable
                                    setState(() {
                                      passwordVisibleActual =
                                          !passwordVisibleActual;
                                    });
                                  },
                                ),
                                border: new OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(100),
                                  ),
                                ),
                                fillColor: colorBlancoOpacidad,
                                filled: true,
                                hintStyle:
                                    new TextStyle(color: colorTextoOpacidad),
                                hintText: claveActualString,
                              ),
                              validator: (value) {
                                if (value.trim().isEmpty) {
                                  return favordigitarelcampoString;
                                }
                                return null;
                              }),
                          espaciado(20, 0),
                          new TextFormField(
                              style: estiloTextoSpacingFont4(
                                  17, Colors.white, true),
                              textInputAction: TextInputAction.go,
                              inputFormatters: [
                                new WhitelistingTextInputFormatter(
                                    RegExp("[a-zA-Zá-úÁ-Ú0-9._,+#=¿?*/@-]")),
                                LengthLimitingTextInputFormatter(100),
                              ],
                              obscureText: passwordVisibleNueva,
                              controller: _controllerClaveNueva,
                              decoration: new InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    passwordVisibleNueva
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Theme.of(context).primaryColorDark,
                                  ),
                                  onPressed: () {
                                    // Update the state i.e. toogle the state of passwordVisible variable
                                    setState(() {
                                      passwordVisibleNueva =
                                          !passwordVisibleNueva;
                                    });
                                  },
                                ),
                                border: new OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(100),
                                  ),
                                ),
                                fillColor: colorBlancoOpacidad,
                                filled: true,
                                hintStyle:
                                    new TextStyle(color: colorTextoOpacidad),
                                hintText: claveNuevaString,
                              ),
                              validator: (value) {
                                if (value.trim().isEmpty) {
                                  return favordigitarelcampoString;
                                }
                                return null;
                              }),
                          espaciado(20, 0),
                          new TextFormField(
                              textInputAction: TextInputAction.go,
                              inputFormatters: [
                                new WhitelistingTextInputFormatter(
                                    RegExp("[a-zA-Zá-úÁ-Ú0-9._,+#=¿?*/-]")),
                                LengthLimitingTextInputFormatter(100),
                              ],
                              style: estiloTextoSpacingFont4(
                                  17, Colors.white, true),
                              obscureText: passwordVisibleConfirma,
                              controller: _controllerClaveConfirmar,
                              decoration: new InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    passwordVisibleConfirma
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Theme.of(context).primaryColorDark,
                                  ),
                                  onPressed: () {
                                    // Update the state i.e. toogle the state of passwordVisible variable
                                    setState(() {
                                      passwordVisibleConfirma =
                                          !passwordVisibleConfirma;
                                    });
                                  },
                                ),
                                border: new OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(100),
                                  ),
                                ),
                                fillColor: colorBlancoOpacidad,
                                filled: true,
                                hintStyle:
                                    new TextStyle(color: colorTextoOpacidad),
                                hintText: claveConfirmarString,
                              ),
                              validator: (value) {
                                if (value.trim().isEmpty) {
                                  return favordigitarelcampoString;
                                }
                                return null;
                              }),

                          espaciado(20, 0),
                          Text(
                            stringClaveRecordatorio,
                            style: estiloTexto(16, colorPrimario, false),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () {
            if (_formKeyTarjeta.currentState.validate()) {
              if (_controllerClaveAntigua.text.toString().length != 0 &&
                  _controllerClaveNueva.text.toString().length != 0 &&
                  _controllerClaveConfirmar.text.toString().length != 0) {
                if (_controllerClaveConfirmar.text.toString().length <= 6) {
                  flusbarMensaje(
                      notificacionString, claveMenor, Colors.red, context);
                } else {
                  String claveAntigua = _controllerClaveAntigua.text.toString();
                  String claveNueva = _controllerClaveNueva.text.toString();
                  String claveConfirmar =
                      _controllerClaveConfirmar.text.toString();

                  if (claveConfirmar == claveNueva) {
                    funcionVerificarConexion(context).then((value) {
                      endPointCambiarClaveSi(context, claveAntigua, claveNueva);
                    });
                  } else {
                    flusbarMensaje(notificacionString, claveNoCoinciden,
                        Colors.red, context);
                  }
                }
              }
            }
          },
          child: widgetBottom(context, "assets/images/icon/Icons-12.svg",
              stringModificarPerfil),
        ));
  }

  @override
  void initState() {
    super.initState();
    _controllerClaveAntigua.clear();
    _controllerClaveConfirmar.clear();
    _controllerClaveNueva.clear();
  }
}
