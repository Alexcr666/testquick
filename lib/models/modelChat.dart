import 'package:cloud_firestore/cloud_firestore.dart';

class modelChat {
  String mensaje, id,idUsuario;
  int tipo;
  Timestamp fecha;




  modelChat(
      this.mensaje,
      this.id,
      this.tipo,
      this.idUsuario,
      this.fecha,
      );
}
