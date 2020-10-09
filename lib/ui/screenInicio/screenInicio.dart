import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testquick/color/color.dart';
import 'package:testquick/endPoint/usuarios/endPointUsuarios.dart';
import 'package:testquick/string/string.dart';
import 'package:testquick/utils/style.dart';
import 'package:testquick/widget/card/cardInicio.dart';
import 'package:testquick/widget/widget.dart';

class screenInicio extends StatefulWidget {
  @override
  _screenInicioState createState() => _screenInicioState();
}

class _screenInicioState extends State<screenInicio> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      backgroundColor: colorFondo,
      body: Column(
        children: [


          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 410,
                foregroundDecoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.transparent, Colors.transparent, colorFondo],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0, 0.3, 0.7, 1],
                  ),
                ),

                child: Image.network('https://cdn.pixabay.com/photo/2017/03/04/12/15/programming-2115930__340.jpg', fit: BoxFit.cover),
              ),
              Container(
                width: double.infinity,
                height: 400,
                color: colorFondo.withOpacity(0.5),
              ),
      Center(child: Container(
          margin: EdgeInsets.only(top: 35),
          child: Text(stringAppName,style: estiloTexto(34,Colors.white,true)))),

      Positioned.fill(
        child: Align(
            alignment: Alignment.bottomCenter,
            child:  Container(
              margin: EdgeInsets.only(left: 20,right: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text("Michael Santiago",style: estiloTexto(22,Colors.white,true),),
                    Text("302393",style: estiloTexto(19,Colors.white,true))

                  ],),
                  espaciado(10, 0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text("Michael Santiago",style: estiloTexto(18,Colors.white,false)),
                    Text("302393",style: estiloTexto(18,Colors.white,false))

                  ],),
                  espaciado(20, 0),
                  SizedBox(

                    child: RaisedButton(


                      elevation: 0,
                      onPressed: () {},
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0.0),
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                      child: Container(
                        width: double.infinity,

                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                Color(0xff7747f3),
                                Color(0xff48a9f2),

                              ],
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(80.0))
                        ),
                        padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                        child:  Center(
                          child: Text(
                              stringEnviarMensaje,
                              style: TextStyle(fontSize: 20)
                          ),
                        ),
                      ),
                    ),
                  ),
                  espaciado(30, 0),
                ],
              ),
            )
        )),

            ],
          ),
          endPointListaUsuarios(context,1),


        ],
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
