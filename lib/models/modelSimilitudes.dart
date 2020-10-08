import 'package:cloud_firestore/cloud_firestore.dart';

class modelSimilitudes {
  String id, idProducto, idUsuario, idRequerimiento;
  int estado;
  Timestamp fecha;

  modelSimilitudes(this.id, this.idProducto, this.idUsuario, this.estado,
      this.idRequerimiento, this.fecha);
}
