// To parse this JSON data, do
//
//     final mensajeModel = mensajeModelFromJson(jsonString);

import 'dart:convert';

MensajeModel mensajeModelFromJson(String str) =>
    MensajeModel.fromJson(json.decode(str));

String mensajeModelToJson(MensajeModel data) => json.encode(data.toJson());

class MensajeModel {
  String fechaCreacion;
  String userId;
  String imagenUrl;
  String mensaje;

  MensajeModel({
    this.fechaCreacion,
    this.userId,
    this.imagenUrl,
    this.mensaje,
  });

  factory MensajeModel.fromJson(Map<String, dynamic> json) => MensajeModel(
        fechaCreacion: json["fecha_creacion"],
        userId: json["userId"],
        imagenUrl: json["imagenUrl"],
        mensaje: json["mensaje"],
      );

  Map<String, dynamic> toJson() => {
        "fecha_creacion": fechaCreacion,
        "userId": userId,
        "imagenUrl": imagenUrl,
        "mensaje": mensaje,
      };
}
