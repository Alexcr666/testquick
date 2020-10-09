import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_crop/image_crop.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:keyboard_actions/keyboard_actions_config.dart';
import 'package:keyboard_actions/keyboard_actions_item.dart';
import 'package:testquick/auth/auth.dart';
import 'package:testquick/color/color.dart';
import 'package:testquick/endPoint/registro/endPointLogin.dart';
import 'package:testquick/models/modelUsuario.dart';

import 'package:testquick/sharedPreferences/sharedPreferences.dart';
import 'package:testquick/string/string.dart';
import 'package:testquick/ui/screenInicio/screenInfoRequest.dart';
import 'package:testquick/ui/screenUsuario/screeLogin.dart';
import 'package:testquick/utils/routes/routes.dart';
import 'package:testquick/utils/style.dart';
import 'package:testquick/utils/utils.dart';
import 'package:testquick/widget/widget.dart';

final cropKey = GlobalKey<CropState>();
final _formKeyEditarCuenta = GlobalKey<FormState>();
final _controllerNombreCompleto = TextEditingController();
final _controllerEmpresa = TextEditingController();
final _controllerDescripcionPerfil = TextEditingController();
final _controllerTelefono = TextEditingController();
final _controllerCorreo = TextEditingController();
final _controllerDireccion = TextEditingController();
modelUsuario modelUser;
String tiempo = "HHHH/MM/DD";
DateTime dateReloj;
bool auth = false;
File _image;
final FirebaseAuth _auth = FirebaseAuth.instance;

var contex2;

funcionGuardarPefil() {
  if (_formKeyEditarCuenta.currentState.validate()) {
    String correo = _controllerCorreo.text;
    String nombreCompleto = _controllerNombreCompleto.text;
    String tel = _controllerTelefono.text;
    String descripcion = _controllerDescripcionPerfil.text;

    if (_controllerNombreCompleto.text.length > 3) {
      if (isEmail(correo) != true) {
        flusbarMensaje(notificacionString, stringCondicion2CrearCuenta,
            Colors.red, contex2);
      } else {
        if (tel.length > 8) {
          if (_image != null) {
            // resetEmail(correo);
            convertBase64(_image).then((valueImagen) {
              endpointEditarUsuario(contex2, nombreCompleto, tel, correo,
                  tiempo, true, valueImagen);
            });
          } else {
            print("prueba90");
            //resetEmail(correo);
            if (modelUser.foto.toString() == "null") {
              endpointEditarUsuario(contex2, nombreCompleto, tel, correo,
                  descripcion, true, null);
            } else {
              endpointEditarUsuario(
                  contex2, nombreCompleto, tel, correo, descripcion, false, "");
            }
          }
        } else {
          flusbarMensaje(
              notificacionString, stringTelefonoMayorA, Colors.red, contex2);
        }
      }
    } else {
      flusbarMensaje(
          notificacionString, stringCondicion1CrearCuenta, Colors.red, contex2);
    }
  }
}

class screenEditarPerfil extends StatefulWidget {
  screenEditarPerfil({Key key}) : super(key: key);

  @override
  _screenEditarPerfilState createState() => _screenEditarPerfilState();
}

bool estadoImagen = false;

class _screenEditarPerfilState extends State<screenEditarPerfil> {
  bool estadoRecordeImagen = false;
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

  actualizar() {
    setState(() {});
  }

  final picker = ImagePicker();

  Future getImageEditarPerfil() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    estadoRecordeImagen = true;
    setState(() {
      _image = File(pickedFile.path);
    });
  }

  Future getImageGaleryEditarPerfil() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    estadoRecordeImagen = true;
    setState(() {
      _image = File(pickedFile.path);
    });
  }

  Future<String> _endPointGuardarImagen() async {
    StorageReference ref = FirebaseStorage.instance
        .ref()
        .child("imagenUsuarios")
        .child(uidUser + ".jpg");
    StorageUploadTask uploadTask = ref.putFile(_image);
    return await (await uploadTask.onComplete).ref.getDownloadURL();
  }

  Widget alertOpcionesEditarImagen(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              GestureDetector(
                onTap: () {
                  funcionAtras(context);
                  //  getImageEditarPerfil();
                },
                child: Column(
                  children: [
                    espaciado(10, 0),
                    Text(
                      tomarFotoString,
                      style: estiloTexto(16, colorTexto, false),
                    ),
                    espaciado(10, 0),
                  ],
                ),
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey,
              ),
              GestureDetector(
                onTap: () {
                  funcionAtras(context);
                  // getImageGaleryEditarPerfil();
                },
                child: Column(
                  children: [
                    espaciado(10, 0),
                    Text(
                      elegirGaleriaString,
                      style: estiloTexto(16, colorTexto, false),
                    ),
                    espaciado(10, 0),
                  ],
                ),
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey,
              ),
              GestureDetector(
                onTap: () {
                  funcionAtras(context);
                },
                child: Column(
                  children: [
                    espaciado(10, 0),
                    Text(
                      stringCancelar,
                      style: estiloTexto(16, colorTexto, false),
                    ),
                    espaciado(10, 0),
                  ],
                ),
              ),
            ]),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    //  SystemChrome.setEnabledSystemUIOverlays([]);
    contex2 = context;
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      //resizeToAvoidBottomPadding: true,
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: KeyboardActions(
              config: _buildConfig(context),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKeyEditarCuenta,
                  child: Column(
                    children: <Widget>[
                      espaciado(40, 0),
                      Row(
                        children: [
                          Expanded(child: SizedBox()),
                          GestureDetector(
                              onTap: () {},
                              child: Text(
                                stringPerfil,
                                style: estiloTextoSpacingFont1(
                                    20, Colors.white, true),
                              )),
                          Expanded(child: SizedBox()),
                          GestureDetector(
                            onTap: () {
                              funcionDeslogueo(context);
                            },
                            child: RotatedBox(
                              quarterTurns: 1,
                              child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: iconSvgColor(
                                      "assets/images/icon/upload-1.svg",
                                      35,
                                      35,
                                      Colors.white)),
                            ),
                          ),
                        ],
                      ),
                      espaciado(20, 0),
                      GestureDetector(
                        onTap: () {
                          estadoImagen = true;
                          actualizar();

                          //endPointCrearUsuario(context, "prueba@gmail.com",
                          //  "alex enrique", 3010101.toString());
                        },
                        child: _image != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Container(
                                    height: 150,
                                    width: 150,
                                    child: Image.file(
                                      _image,
                                      height: 150,
                                      width: 150,
                                    )),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Container(
                                  height: 150,
                                  width: 150,
                                  child: modelUser.toString() == "null"
                                      ? Image.asset(
                                          "assets/images/icon/imagenPerfil.png",
                                          height: 150,
                                          width: 150,
                                        )
                                      : modelUser.foto.toString() == "null"
                                          ? Image.asset(
                                              "assets/images/icon/imagenPerfil.png",
                                              height: 150,
                                              width: 150,
                                            )
                                          : widgetImage(
                                              modelUser.foto.toString(),
                                              150,
                                              150),
                                ),
                              ),
                      ),
                      espaciado(20, 0),
                      Container(
                          child: TextFormField(
                        inputFormatters: [
                          new WhitelistingTextInputFormatter(
                              RegExp("[a -zA-Zá-úÁ-Ú0-9._,+#=¿?*/@-]")),
                          LengthLimitingTextInputFormatter(100),
                        ],
                        validator: (value) {
                          if (value.trim().isEmpty) {
                            return favordigitarelcampoString;
                          }
                          return null;
                        },
                        style: estiloTextoSpacingFont4(15, Colors.white, true),
                        textInputAction: TextInputAction.go,
                        controller: _controllerNombreCompleto,
                        decoration: estiloCampoTexto(stringNombreCompleto),
                      )),
                      espaciado(20, 0),
                      Container(
                        height: 5 * 24.0,
                        child: TextField(
                          style:
                              estiloTextoSpacingFont4(15, Colors.white, true),
                          inputFormatters: [
                            new WhitelistingTextInputFormatter(
                                RegExp("[a -zA-Zá-úÁ-Ú0-9._,+#=¿?*/@-]")),
                            LengthLimitingTextInputFormatter(500),
                          ],
                          textInputAction: TextInputAction.go,
                          maxLines: 5,
                          controller: _controllerDescripcionPerfil,
                          decoration:
                              estiloCampoTextoMulti(stringDescripcionPerfil),
                        ),
                      ),
                      espaciado(20, 0),
                      Container(
                        child: TextFormField(
                            validator: (value) {
                              if (value.trim().isEmpty) {
                                return favordigitarelcampoString;
                              }
                              return null;
                            },
                            focusNode: _nodeText1,
                            style:
                                estiloTextoSpacingFont4(15, Colors.white, true),
                            inputFormatters: [
                              WhitelistingTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(100),
                            ],
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.go,
                            controller: _controllerTelefono,
                            decoration: estiloCampoTexto(stringTelefono)),
                      ),
                      espaciado(20, 0),
                      Container(
                        child: TextFormField(
                          inputFormatters: [
                            new WhitelistingTextInputFormatter(
                                RegExp("[a-zA-Zá-úÁ-Ú0-9._,+#=¿?*/@-]")),
                            LengthLimitingTextInputFormatter(100),
                          ],
                          validator: (value) {
                            if (value.trim().isEmpty) {
                              return favordigitarelcampoString;
                            }
                            return null;
                          },
                          style:
                              estiloTextoSpacingFont4(15, Colors.white, true),
                          textInputAction: TextInputAction.go,
                          controller: _controllerCorreo,
                          decoration: estiloCampoTexto(stringCorreo),
                        ),
                      ),
                      espaciado(20, 0),
                      GestureDetector(
                        onTap: () {
                          routesCambiarClave(context);
                        },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            stringCambiarClave,
                            style: estiloTexto(20, Colors.white, true),
                          ),
                        ),
                      ),
                      espaciado(150, 0),
                    ],
                  ),
                ),
              ),
            ),
          ),
          estadoImagen != true
              ? espaciado(0, 0)
              : GestureDetector(
                  onTap: () {
                    estadoImagen = false;
                    actualizar();
                  },
                  child: Container(
                    child: Center(
                      child: Column(
                        children: [
                          Expanded(child: SizedBox()),
                          Text(
                            stringUploadImages,
                            style: estiloTexto(20, Colors.white, true),
                          ),
                          espaciado(20, 0),
                          Row(
                            children: [
                              Expanded(child: SizedBox()),
                              GestureDetector(
                                onTap: () {
                                  estadoImagen = false;
                                  actualizar();
                                  getImageEditarPerfil();
                                },
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                  size: 80,
                                ),
                              ),
                              espaciado(0, 20),
                              GestureDetector(
                                onTap: () {
                                  estadoImagen = false;
                                  actualizar();
                                  getImageGaleryEditarPerfil();
                                },
                                child: Icon(
                                  Icons.photo,
                                  color: Colors.white,
                                  size: 80,
                                ),
                              ),
                              Expanded(child: SizedBox()),
                            ],
                          ),
                          espaciado(60, 0),
                          GestureDetector(
                            onTap: () {
                              _image = null;
                              modelUser.foto = null;

                              estadoImagen = false;

                              actualizar();
                            },
                            child: _image == null
                                ? modelUser.foto.toString() != "null"
                                    ? Icon(
                                        Icons.delete,
                                        size: 60,
                                        color: Colors.white,
                                      )
                                    : espaciado(0, 0)
                                : Icon(
                                    Icons.delete,
                                    size: 60,
                                    color: Colors.white,
                                  ),
                          ),
                          espaciado(20, 0),
                          Expanded(child: SizedBox()),
                        ],
                      ),
                    ),
                    color: Colors.black.withOpacity(0.5),
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
          estadoImagen == true
              ? espaciado(0, 0)
              : Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Theme(
                      data: Theme.of(context)
                          .copyWith(canvasColor: Colors.transparent),
                      child: GestureDetector(
                          onTap: () {
                            funcionGuardarPefil();
                          },
                          child: Container(
                            child: widgetBottom(
                                context,
                                "assets/images/icon/Icons-12.svg",
                                stringModificarPerfil),
                          )),
                    )
                  ],
                ),
          estadoRecordeImagen != true
              ? espaciado(0, 0)
              : SafeArea(
                  child: Container(
                    color: Colors.black,
                    padding: const EdgeInsets.symmetric(
                        vertical: 40.0, horizontal: 20.0),
                    child: _buildCroppingImage(),
                  ),
                ),
        ],
      ),
      backgroundColor: colorFondo,

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildCroppingImage() {
    return Column(
      children: <Widget>[
        _image == null
            ? espaciado(0, 0)
            : Expanded(
                child: Crop.file(_image, key: cropKey),
              ),
        Container(
          padding: const EdgeInsets.only(top: 20.0),
          alignment: AlignmentDirectional.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FlatButton(
                child: Text(
                  'Crop Image',
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .copyWith(color: Colors.white),
                ),
                onPressed: () => _cropImage(),
              ),
            ],
          ),
        )
      ],
    );
  }

  Future<void> _cropImage() async {
    final scale = cropKey.currentState.scale;
    final area = cropKey.currentState.area;
    if (area == null) {
      // cannot crop, widget is not setup
      return;
    }

    // scale up to use maximum possible number of pixels
    // this will sample image in higher resolution to make cropped image larger
    File imageCrop = _image;

    final sample = await ImageCrop.sampleImage(
      file: imageCrop,
      preferredSize: (2000 / scale).round(),
    );

    final file = await ImageCrop.cropImage(
      file: sample,
      area: area,
    );
    _image = file;

    sample.delete();

    estadoRecordeImagen = false;
    actualizar();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    endPointUsuario().then((value) {
      modelUser = value;

      _controllerNombreCompleto.text = value.nombreCompleto;
      _controllerDescripcionPerfil.text = value.descripcionPerfil;
      _controllerTelefono.text = value.tel;
      _controllerCorreo.text = value.email;
      actualizar();
    });
  }
}
