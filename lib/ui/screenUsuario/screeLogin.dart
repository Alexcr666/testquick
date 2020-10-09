import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testquick/Animation/FadeAnimation.dart';
import 'package:testquick/auth/auth.dart';
import 'package:testquick/color/color.dart';
import 'package:testquick/ui/screenUsuario/screenRecuperarClave.dart';
import 'package:testquick/string/string.dart';
import 'package:testquick/utils/routes/routes.dart';
import 'package:testquick/utils/style.dart';
import 'package:testquick/utils/utils.dart';
import 'package:testquick/widget/widget.dart';

final _ediUsuario = TextEditingController();
final _ediPassword = TextEditingController();

class screenLogin extends StatefulWidget {
  screenLogin({Key key}) : super(key: key);

  @override
  _screenLoginState createState() => _screenLoginState();
}

bool estadoImagen = false;

class _screenLoginState extends State<screenLogin> {
  final _formKey = GlobalKey<FormState>();
  String stringCorreoPrueba = lenguaje == "es_ES" ? "Correo" : "Email";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorFondo,
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              FadeAnimation(
                                  1.8,
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    child: Column(
                                      children: <Widget>[
                                        Image.asset(
                                          "assets/images/image/logo.png",
                                          height: 170,
                                          width: 170,
                                        ),
                                        espaciado(20, 0),
                                        Container(
                                          padding: EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color:
                                                          Colors.grey[100]))),
                                          child: TextFormField(
                                            validator: (value) {
                                              if (value.trim().isEmpty) {
                                                return favorCompletarElCampoString;
                                              }
                                              return null;
                                            },
                                            inputFormatters: [
                                              new WhitelistingTextInputFormatter(
                                                  RegExp(
                                                      "[a-zA-Zá-úÁ-Ú0-9._,+#=¿?*/@-]")),
                                              LengthLimitingTextInputFormatter(
                                                  100),
                                            ],
                                            controller: _ediUsuario,
                                            style:
                                                TextStyle(color: Colors.white),
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: stringCorreoPrueba,
                                                hintStyle: TextStyle(
                                                    color: Colors.grey[400])),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            inputFormatters: [
                                              new WhitelistingTextInputFormatter(
                                                  RegExp(
                                                      "[a-zA-Zá-úÁ-Ú0-9._,+#=¿?*/@-]")),
                                              LengthLimitingTextInputFormatter(
                                                  100),
                                            ],
                                            style:
                                                TextStyle(color: Colors.white),
                                            validator: (value) {
                                              if (value.trim().isEmpty) {
                                                return favorCompletarElCampoString;
                                              }
                                              return null;
                                            },
                                            obscureText: true,
                                            controller: _ediPassword,
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: stringClavetxt,
                                                hintStyle: TextStyle(
                                                    color: Colors.grey[400])),
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                              widgetDivider(),
                              SizedBox(
                                height: 30,
                              ),
                              FadeAnimation(
                                  2,
                                  GestureDetector(
                                    onTap: () {
                                      if (_formKey.currentState.validate()) {
                                        String correo =
                                            _ediUsuario.text.toString();
                                        String clave =
                                            _ediPassword.text.toString();

                                        if (estadoLogin != 3) {
                                          estadoLogin = 1;
                                        }
                                        if (isEmail(correo) == true) {
                                          showProgressGlobal(context, true);
                                          authLogueo(context, correo, clave)
                                              .then((value) {
                                            _ediPassword.clear();
                                          });
                                        } else {
                                          flusbarMensaje(
                                              notificacionString,
                                              stringCondicion2CrearCuenta,
                                              Colors.red,
                                              context);
                                        }

                                        // If the form is valid, display a snackbar. In the real world,
                                        // you'd often call a server or save the information in a database.

                                      } else {
                                        if (_ediUsuario.text.trim().length ==
                                            0) {
                                          flusbarMensaje(
                                              notificacionString,
                                              stringFaltaCorreo,
                                              Colors.red,
                                              context);
                                        }
                                        if (_ediPassword.text.trim().length ==
                                            0) {
                                          flusbarMensaje(
                                              notificacionString,
                                              stringFaltaClave,
                                              Colors.red,
                                              context);
                                        }
                                      }
                                    },
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          gradient: LinearGradient(colors: [
                                            colorPrimario,
                                            colorPrimario,
                                          ])),
                                      child: Center(
                                        child: Text(
                                          stringEntrar,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  )),
                              espaciado(30, 0),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            screenRecuperarClave()),
                                  );
                                },
                                child: Text(
                                  hasOlvidadoTuClave,
                                  style: estiloTexto(15, Colors.white, false),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  routesCrearCuentaFinal(context);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: 80),
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Expanded(child: SizedBox()),
                                        Text(
                                          stringNoTienesCuenta,
                                          style: estiloTexto(
                                              15, Colors.white, true),
                                        ),
                                        espaciado(0, 10),
                                        Text(
                                          stringRegistrarse,
                                          style: estiloTexto(
                                              17, Colors.blue, true),
                                        ),
                                        Expanded(child: SizedBox()),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              espaciado(20, 0),
                              SizedBox(
                                height: 70,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print("prueba80:"+lenguaje);
  }
}
