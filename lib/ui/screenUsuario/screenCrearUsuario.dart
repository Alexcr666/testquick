import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:keyboard_actions/keyboard_actions_config.dart';
import 'package:keyboard_actions/keyboard_actions_item.dart';
import 'package:testquick/auth/auth.dart';
import 'package:testquick/color/color.dart';
import 'package:testquick/endPoint/registro/endPointLogin.dart';
import 'package:testquick/sharedPreferences/sharedPreferences.dart';
import 'package:testquick/string/string.dart';
import 'package:testquick/utils/routes/routes.dart';
import 'package:testquick/utils/style.dart';
import 'package:testquick/utils/utils.dart';
import 'package:testquick/widget/widget.dart';
import 'package:url_launcher/url_launcher.dart';

class screenCrearUsuario extends StatefulWidget {
  @override
  _screenCrearUsuarioState createState() => _screenCrearUsuarioState();
}

bool crearUsuarioActivo = false;

enum authProblems { UserNotFound, PasswordNotValid, NetworkError }

final _controllerNombreCompleto = TextEditingController();
final _controllerEmail = TextEditingController();
final _controllerCelular = TextEditingController();
final _controllerClave = TextEditingController();

final _formKeyCrearCuenta = GlobalKey<FormState>();

class _screenCrearUsuarioState extends State<screenCrearUsuario> {
  bool _passwordVisible = true;

  int _nombreCompleto, _correo, _celular, _clave = 0;
  bool checkRegistro = false;

  actualizar() {
    setState(() {});
  }

  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  final FocusNode _nodeText3 = FocusNode();
  final FocusNode _nodeText4 = FocusNode();
  final FocusNode _nodeText5 = FocusNode();
  final FocusNode _nodeText6 = FocusNode();

  /// Creates the [KeyboardActionsConfig] to hook up the fields
  /// and their focus nodes to our [FormKeyboardActions].
  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.grey[200],
      nextFocus: true,
      actions: [
        KeyboardActionsItem(
          focusNode: _nodeText1,
        ),
        KeyboardActionsItem(focusNode: _nodeText2, toolbarButtons: [
          (node) {
            return GestureDetector(
              onTap: () => node.unfocus(),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.close),
              ),
            );
          }
        ]),
        KeyboardActionsItem(
          focusNode: _nodeText3,
          onTapAction: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text("Custom Action"),
                    actions: <Widget>[
                      FlatButton(
                        child: Text("OK"),
                        onPressed: () => Navigator.of(context).pop(),
                      )
                    ],
                  );
                });
          },
        ),
        KeyboardActionsItem(
          focusNode: _nodeText4,
        ),
        KeyboardActionsItem(
          focusNode: _nodeText5,
          toolbarButtons: [
            //button 1
            (node) {
              return GestureDetector(
                onTap: () => node.unfocus(),
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "CLOSE",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              );
            },
            //button 2
            (node) {
              return GestureDetector(
                onTap: () => node.unfocus(),
                child: Container(
                  color: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "DONE",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            }
          ],
        ),
        KeyboardActionsItem(
          focusNode: _nodeText6,
          footerBuilder: (_) => PreferredSize(
              child: SizedBox(
                  height: 40,
                  child: Center(
                    child: Text('Custom Footer'),
                  )),
              preferredSize: Size.fromHeight(40)),
        ),
      ],
    );
  }

  _limpiar() {
    _controllerClave.clear();
    _controllerNombreCompleto.clear();
    _controllerCelular.clear();
    _controllerEmail.clear();
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
        body: Stack(
          children: [
            /*Image.asset(
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
              child: KeyboardActions(
                config: _buildConfig(context),
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Form(
                                key: _formKeyCrearCuenta,
                                child: Column(
                                  children: [
                                    espaciado(30, 0),
                                    widgetCabezera(context, stringRegistrarsetxt),
                                    espaciado(60, 0),
                                    TextFormField(
                                        inputFormatters: [
                                          new WhitelistingTextInputFormatter(RegExp(
                                              "[a -zA-Zá-úÁ-Ú0-9._,+#=¿?*/@-]")),
                                          LengthLimitingTextInputFormatter(100),
                                        ],
                                        controller: _controllerNombreCompleto,
                                        style: TextStyle(color: Colors.white),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: stringNombreCompleto,
                                          hintStyle:
                                              TextStyle(color: Colors.white60),
                                          suffixIcon: _nombreCompleto == 0
                                              ? SizedBox()
                                              : _nombreCompleto != 1
                                                  ? Transform.rotate(
                                                      angle: 40,
                                                      child: IconButton(
                                                        icon: Icon(
                                                          Icons
                                                              .add_circle_outline,
                                                          color: colorRojoBoton,
                                                        ),
                                                      ),
                                                    )
                                                  : IconButton(
                                                      icon: Icon(
                                                        Icons
                                                            .check_circle_outline,
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
                                    espaciado(10, 0),
                                    TextFormField(
                                        inputFormatters: [
                                          new WhitelistingTextInputFormatter(RegExp(
                                              "[a-zA-Zá-úÁ-Ú0-9._,+#=¿?*/@-]")),
                                          LengthLimitingTextInputFormatter(100),
                                        ],
                                        style: TextStyle(color: Colors.white),
                                        controller: _controllerEmail,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintStyle:
                                              TextStyle(color: Colors.white60),
                                          hintText: stringCorreo,
                                          suffixIcon: _correo == 0
                                              ? SizedBox()
                                              : _correo != 1
                                                  ? Transform.rotate(
                                                      angle: 40,
                                                      child: IconButton(
                                                        icon: Icon(
                                                          Icons
                                                              .add_circle_outline,
                                                          color: colorRojoBoton,
                                                        ),
                                                      ),
                                                    )
                                                  : IconButton(
                                                      icon: Icon(
                                                        Icons
                                                            .check_circle_outline,
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
                                    espaciado(10, 0),
                                    TextFormField(
                                        focusNode: _nodeText1,
                                        style: TextStyle(color: Colors.white),
                                        controller: _controllerCelular,
                                        inputFormatters: [
                                          WhitelistingTextInputFormatter
                                              .digitsOnly,
                                          LengthLimitingTextInputFormatter(100),
                                        ],
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintStyle:
                                              TextStyle(color: Colors.white60),
                                          hintText: stringCelular,
                                          suffixIcon: _celular == 0
                                              ? SizedBox()
                                              : _celular != 1
                                                  ? Transform.rotate(
                                                      angle: 40,
                                                      child: IconButton(
                                                        icon: Icon(
                                                          Icons
                                                              .add_circle_outline,
                                                          color: colorRojoBoton,
                                                        ),
                                                      ),
                                                    )
                                                  : IconButton(
                                                      icon: Icon(
                                                        Icons
                                                            .check_circle_outline,
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
                                    espaciado(10, 0),
                                    TextFormField(
                                        style: TextStyle(color: Colors.white),
                                        inputFormatters: [
                                          new WhitelistingTextInputFormatter(RegExp(
                                              "[a-zA-Zá-úÁ-Ú0-9._,+#=¿?*/@-]")),
                                          LengthLimitingTextInputFormatter(100),
                                        ],
                                        controller: _controllerClave,
                                        obscureText: _passwordVisible,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintStyle:
                                              TextStyle(color: Colors.white60),
                                          hintText: stringClavetxt,
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              // Based on passwordVisible state choose the icon
                                              _passwordVisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: Theme.of(context)
                                                  .primaryColorDark,
                                            ),
                                            onPressed: () {
                                              // Update the state i.e. toogle the state of passwordVisible variable
                                              setState(() {
                                                _passwordVisible =
                                                    !_passwordVisible;
                                              });
                                            },
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value.trim().isEmpty) {
                                            return favordigitarelcampoString;
                                          }
                                          return null;
                                        }),
                                    espaciado(5, 0),
                                    widgetDivider(),
                                    espaciado(20, 0),
                                    Row(
                                      children: [
                                        Theme(
                                          data: Theme.of(context).copyWith(
                                            unselectedWidgetColor: Colors.white,
                                          ),
                                          child: Checkbox(
                                              value: checkRegistro,
                                              checkColor: colorPrimario,
                                              //focusColor: Colors.white,
                                              // color of tick Mark
                                              activeColor: Colors.white,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  checkRegistro = value;
                                                });
                                              }),
                                        ),
                                        GestureDetector(
                                            onTap: () {
                                              checkRegistro = !checkRegistro;
                                              actualizar();
                                              // routesNavegador(context, "fff",
                                              //   "https://firebasestorage.googleapis.com/v0/b/dommy-646f7.appspot.com/o/politicas%2FTe%CC%81rminos%20y%20condiciones%20de%20usopdf.pdf?alt=media&token=854ef0c7-8b1a-473f-a179-507ff4d4fa73");
                                            },
                                            child: Text(stringAceptarTerminos,
                                                style: estiloTexto(
                                                    15, Colors.white60, false)))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              //espaciado(5, 0),
                              espaciado(50, 0),

                              GestureDetector(
                                  onTap: () {
                                    _formKeyCrearCuenta.currentState.validate();

                                    if (_controllerNombreCompleto.text.length >
                                        3) {
                                      _nombreCompleto = 1;

                                    } else {
                                      _nombreCompleto = 2;
                                    }


                                    if (isEmail(_controllerEmail.text) ==
                                        true) {
                                      _correo = 1;
                                      actualizar();

                                    } else {
                                      _correo = 2;
                                    }
                                    if (_controllerCelular.text.length > 8) {
                                      _celular = 1;
                                      actualizar();

                                    } else {
                                      _celular = 2;
                                    }


                                    if (_controllerClave.text.length <= 5) {

                                    } else {
                                      _clave = 2;
                                    }


                                    if (_controllerNombreCompleto.text.length >
                                        3) {
                                      _nombreCompleto = 1;
                                      if (isEmail(_controllerEmail.text) ==
                                          true) {
                                        _correo = 1;
                                        actualizar();
                                        if (_controllerCelular.text.length > 8) {
                                          _celular = 1;
                                          actualizar();
                                          if (_controllerClave.text.length <= 6) {

                                            flusbarMensaje(notificacionString,
                                                claveMenor, Colors.red, context);
                                          } else {
                                            if (checkRegistro == true) {
                                              if (_formKeyCrearCuenta.currentState
                                                  .validate()) {
                                                String celular =
                                                    _controllerCelular.text
                                                        .toString();

                                                funcionVerificarConexion(context)
                                                    .then((value) {
                                                  if (value == true) {
                                                    authRegistro(
                                                            context,
                                                            _controllerEmail.text
                                                                .toString(),
                                                            _controllerClave.text
                                                                .toString())
                                                        .then((value) {
                                                      //routesInicioFinal(context, 2);
                                                      if (value != null) {
                                                        sinLogin = false;

                                                        verificarLogin()
                                                            .then((value) {
                                                          endPointCrearUsuario(
                                                                  context,
                                                                  _controllerEmail
                                                                      .text,
                                                                  _controllerNombreCompleto
                                                                      .text,
                                                                  uidUser,
                                                                  celular)
                                                              .then((value) {
                                                            if (value != false) {
                                                              guardarSession(
                                                                  uidUser);

                                                              routesInicio(
                                                                  context);
                                                            } else {
                                                              flusbarMensaje(
                                                                  notificacionString,
                                                                  datosIconrrectosString,
                                                                  Colors.red,
                                                                  context);
                                                            }
                                                          });
                                                        });
                                                      } else {
                                                        flusbarMensaje(
                                                            notificacionString,
                                                            datosIconrrectosString,
                                                            Colors.red,
                                                            context);
                                                      }
                                                    }).catchError((e) {
                                                      //print(e.toString());
                                                      //   flusbarMensaje(notificacionString,
                                                      //     e.toString(), Colors.red, context);

                                                      String errorMessage;

                                                      switch (e.message) {
                                                        case 'There is no user record corresponding to this identifier. The user may have been deleted.':
                                                          errorMessage =
                                                              errorNotificacionString;

                                                          break;
                                                        case 'The password is invalid or the user does not have a password.':
                                                          errorMessage =
                                                              "Clave invalida";

                                                          break;
                                                        case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
                                                          errorMessage =
                                                              "Tiempo de respuesta agotado";
                                                          break;
                                                        case 'The email address is already in use by another account.':
                                                          errorMessage =
                                                              "Este correo ya se encuentra en uso";
                                                          break;

                                                        // ...
                                                        default:
                                                          errorMessage =
                                                              errorNotificacionString;
                                                          break;
                                                      }

                                                      flusbarMensaje(
                                                          notificacionString
                                                              .toString(),
                                                          errorMessage,
                                                          Colors.red,
                                                          context);
                                                    });
                                                  }
                                                });
                                              }
                                            }else{
                                              flusbarMensaje(
                                                  notificacionString,
                                                  stringAceptarTerminos,
                                                  Colors.red,
                                                  context);
                                            }
                                          }
                                        } else {
                                          flusbarMensaje(
                                              notificacionString,
                                              stringTelefonoMayorA,
                                              Colors.red,
                                              context);
                                          _celular = 2;
                                        }
                                      } else {
                                        flusbarMensaje(
                                            notificacionString,
                                            stringCondicion2CrearCuenta,
                                            Colors.red,
                                            context);
                                        _correo = 2;
                                      }
                                    } else {
                                      flusbarMensaje(
                                          notificacionString,
                                          stringCondicion1CrearCuenta,
                                          Colors.red,
                                          context);
                                      _nombreCompleto = 2;
                                    }

                                    actualizar();
                                  },
                                  child: buttonApp(stringRegistrarsetxt)),
                              espaciado(0, 10),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //actuali

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    _correo = 0;
    _nombreCompleto = 0;
    _celular = 0;
    _controllerClave.clear();
    _controllerEmail.clear();
    _controllerNombreCompleto.clear();
    _controllerCelular.clear();

    actualizar();
  }
}
