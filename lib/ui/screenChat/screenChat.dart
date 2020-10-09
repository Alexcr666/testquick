import 'dart:io';

import 'package:audio_recorder/audio_recorder.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:image_crop/image_crop.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:testquick/color/color.dart';
import 'package:testquick/endPoint/chat/endPointChat.dart';
import 'package:testquick/models/modelUsuario.dart';
import 'package:testquick/string/string.dart';
import 'package:testquick/utils/style.dart';
import 'package:testquick/utils/utils.dart';
import 'package:testquick/widget/card/cardInicio.dart';
import 'package:testquick/widget/card/cardItemChat.dart';
import 'package:testquick/widget/card/cardItemChatTexto.dart';
import 'package:testquick/widget/widget.dart';

final _height = 100.0;
final cropKey = GlobalKey<CropState>();
final controllerListaChat = ScrollController();
final _scaffoldKey = GlobalKey<ScaffoldState>();
final _formKeyLogueo = GlobalKey<FormState>();
Recording _recording = new Recording();
bool _isRecording = false;

animateToIndex(i) => controllerListaChat.animateTo(_height * i,
    duration: Duration(seconds: 2), curve: Curves.fastOutSlowIn);

class screenChatUsuario extends StatefulWidget {
  screenChatUsuario({
    Key key,
    this.idChat,
    this.usuario,
  });

  String idChat;
  modelUsuario usuario;

  @override
  _screenChatUsuarioState createState() => _screenChatUsuarioState();
}

class _screenChatUsuarioState extends State<screenChatUsuario> {
  String mensaje;
  bool estadoAudio = false;

  final _controllerMensaje = TextEditingController();
  bool estadoEscribiendo = false;
  bool estadoRecordeImagen = false;
  bool estadoImagen = false;
  File _image;

  actualizar() {
    setState(() {});
  }

  _start() async {
    funcionPermisos();

    try {
      if (await AudioRecorder.hasPermissions) {
        Directory storageDirectory = await getApplicationDocumentsDirectory();
        String referenceCode =
            "audios" + DateTime.now().millisecondsSinceEpoch.toString();
        String sdPath = storageDirectory.path + "/record/$referenceCode.wav";
        // print("Start recording: $path");
        //await AudioRecorder.start(
        //  path: sdPath, audioOutputFormat: AudioOutputFormat.WAV);
        await AudioRecorder.start();
        //bool isRecording = await AudioRecorder.isRecording;

      } else {
        Scaffold.of(context).showSnackBar(
            new SnackBar(content: new Text("You must accept permissions")));
      }
    } catch (e) {
      print(e);
    }
  }

  _stop() async {
    var recording = await AudioRecorder.stop();

    print("Stop recording: ${recording.path}");

    final filePath = await FlutterAbsolutePath.getAbsolutePath(recording.path);

    File tempFile = File(filePath);
    Future<String> _endPointGuardarImagen(File _image) async {
      String referenceCode =
          "audios" + DateTime.now().millisecondsSinceEpoch.toString();
      StorageReference ref = FirebaseStorage.instance
          .ref()
          .child("audios")
          .child(referenceCode + ".WAV");
      StorageUploadTask uploadTask = ref.putFile(tempFile);
      return await (await uploadTask.onComplete).ref.getDownloadURL();
    }

    _endPointGuardarImagen(tempFile).then((value) {
      endPointCrearMensaje(widget.idChat, value, 3).then((value) {
        _controllerMensaje.clear();
        estadoEscribiendo = false;
      });
    });
    //File file = widget.localFileSystem.file(recording.path);

    print("prueba90" + filePath.length.toString());

    //_controller.text = recording.path;
  }

  /*_stop() async {
    var recording = await AudioRecorder.stop();
    final filePath = await FlutterAbsolutePath.getAbsolutePath(recording.path);
    File tempFile = File(filePath);
    Future<String> _endPointGuardarImagen(File _image) async {
      String referenceCode =
          "audios" + DateTime.now().millisecondsSinceEpoch.toString();
      StorageReference ref = FirebaseStorage.instance
          .ref()
          .child("audios")
          .child(referenceCode + ".AAC");
      StorageUploadTask uploadTask = ref.putFile(tempFile);
      return await (await uploadTask.onComplete).ref.getDownloadURL();
    }

    _endPointGuardarImagen(tempFile);
  }*/

  funcionGrabarAudio() {}

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

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      backgroundColor: colorFondo,
      body: Stack(
        children: [
          Container(
            child: ListView(
              children: <Widget>[
                espaciado(25, 0),
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            funcionAtras(context);
                          },
                          child: iconSvgColor("assets/images/icon/back.svg", 33,
                              33, Colors.white)),
                      espaciado(0, 20),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: widgetImage(widget.usuario.foto, 60, 60)),
                      espaciado(0, 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.usuario.nombreCompleto,
                              style: estiloTexto(22, Colors.white, true)),
                          Text(widget.usuario.email,
                              style: estiloTexto(18, Colors.white, false)),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25.0),
                endPointListaMensajes(context, widget.idChat),
                espaciado(120, 0),
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Theme(
                data:
                    Theme.of(context).copyWith(canvasColor: Colors.transparent),
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  height: 70,
                  width: double.infinity,
                  decoration: estiloRedondeado(colorBlancoOpacidad, 100),
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            estadoImagen = true;
                            actualizar();
                          },
                          child: iconSvgColor(
                              "assets/images/icon/photo-camera.svg",
                              30,
                              30,
                              colorTextoOpacidad),
                        ),
                        espaciado(0, 10),
                        espaciado(0, 10),
                        Expanded(
                          child: Container(
                            child: estadoAudio == true
                                ? Text(stringGrabando,
                                    style: estiloTextoSpacingFont4(
                                        15, Colors.white, true))
                                : TextField(
                                    controller: _controllerMensaje,
                                    onChanged: (text) {
                                      if (text.trim().length != 0) {
                                        estadoEscribiendo = true;
                                      } else {
                                        estadoEscribiendo = false;
                                      }
                                      actualizar();
                                    },
                                    style: estiloTextoSpacingFont4(
                                        15, Colors.white, true),
                                    textInputAction: TextInputAction.go,
                                    decoration:
                                        estiloCampoTexto(stringMensaje)),
                          ),
                        ),
                        estadoEscribiendo == true
                            ? GestureDetector(
                                onTap: () {
                                  int tipo;

                                  tipo = 1;
                                  mensaje = _controllerMensaje.text.toString();

                                  //animateToIndex(2);
                                  endPointCrearMensaje(
                                          widget.idChat, mensaje, tipo)
                                      .then((value) {
                                    _controllerMensaje.clear();
                                    estadoEscribiendo = false;
                                    actualizar();
                                  });
                                },
                                child: iconSvgColor(
                                    "assets/images/icon/paper-plane.svg",
                                    30,
                                    30,
                                    colorTextoOpacidad),
                              )
                            : GestureDetector(
                                onTap: () {
                                  estadoAudio = !estadoAudio;
                                  if (estadoAudio == true) {
                                    _start();
                                  } else {
                                    print("pause");
                                    _stop();
                                  }
                                  actualizar();
                                },
                                child: iconSvgColor(
                                    "assets/images/icon/speaker.svg",
                                    32,
                                    32,
                                    colorTextoOpacidad),
                              ),
                      ],
                    ),
                  ),
                ),
              )
            ],
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
    );
  }

  Widget _buildCroppingImage() {
    return Column(
      children: <Widget>[
        Expanded(
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

    convertBase64(_image).then((valueImagen) {
      mensaje = valueImagen;
      endPointCrearMensaje(widget.idChat, mensaje, 2).then((value) {
        _image = null;
        _controllerMensaje.clear();
        estadoEscribiendo = false;
        actualizar();
      });
    });
    actualizar();
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    funcionPermisos();
    SystemChrome.setEnabledSystemUIOverlays([]);
  }
}
