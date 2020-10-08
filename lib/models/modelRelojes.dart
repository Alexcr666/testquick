import 'package:cloud_firestore/cloud_firestore.dart';

class modelRelojes {
  String id,
      descripcion,
      nombre,
      idUsuario,
      foto,
      model,
      fechaCompra,
      boung,
      image64,
      memoString,
      foto2,
      foto3,
      foto4,
      foto5,
      foto6;
  String reference, serie, campoTo;
  bool private, hold, memo, available, sold, online;
  bool nuevo, slider, used, complete, watch, naked;
  Timestamp fecha, fechaCompraDate;

  int purchase, selling, soldFor;

  modelRelojes(
    this.id,
    this.nombre,
    this.descripcion,
    this.idUsuario,
    this.foto,
    this.model,
    this.fechaCompra,
    this.purchase,
    this.selling,
    this.soldFor,
    this.boung,
    this.memoString,
    this.reference,
    this.private,
    this.hold,
    this.memo,
    this.available,
    this.sold,
    this.nuevo,
    this.slider,
    this.used,
    this.complete,
    this.watch,
    this.naked,
    this.foto2,
    this.foto3,
    this.foto4,
    this.foto5,
    this.foto6,
    this.fecha,
    this.fechaCompraDate,
    this.serie,
    this.campoTo,
    this.image64,
    this.online,
  );
}
