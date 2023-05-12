// To parse this JSON data, do
//
//     final retosModel = retosModelFromJson(jsonString);

import 'dart:convert';

RetosModel retosModelFromJson(String str) =>
    RetosModel.fromJson(json.decode(str));

String retosModelToJson(RetosModel data) => json.encode(data.toJson());

class RetosModel {
  RetosModel({
    required this.retos,
  });

  List<Reto> retos;

  factory RetosModel.fromJson(Map<String, dynamic> json) => RetosModel(
        retos: List<Reto>.from(json["retos"].map((x) => Reto.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "retos": List<dynamic>.from(retos.map((x) => x.toMap())),
      };
}

class Reto {
  Reto({
    required this.fl_reto,
    required this.nb_reto,
    required this.ds_resumen,
    required this.no_puntos,
    required this.fe_inicio,
    required this.fe_fin,
    required this.ds_imagen,
    required this.ds_color,
    required this.fg_tipo,
    required this.fl_evaluacion,
    required this.fg_estatus_usuario_reto,
  });

  String fl_reto;
  String nb_reto;
  String ds_resumen;
  String no_puntos;
  String fe_inicio;
  String fe_fin;
  String ds_imagen;
  String ds_color;
  String fg_tipo;
  String fl_evaluacion;
  String fg_estatus_usuario_reto;

  factory Reto.fromJson(Map<String, dynamic> json) => Reto(
        fl_reto: json["fl_reto"].toString(),
        nb_reto: json["nb_reto"].toString(),
        ds_resumen: json["ds_resumen"].toString(),
        no_puntos: json["no_puntos"].toString(),
        fe_inicio: json["fe_inicio"].toString(),
        fe_fin: json["fe_fin"].toString(),
        ds_imagen: json["ds_imagen"].toString(),
        ds_color: json["ds_color"].toString(),
        fg_tipo: json["fg_tipo"].toString(),
        fl_evaluacion: json["fl_evaluacion"].toString(),
        fg_estatus_usuario_reto: json["fg_estatus_usuario_reto"].toString(),
      );

  Map<String, dynamic> toMap() => {
        "fl_reto": fl_reto,
        "nb_reto": nb_reto,
        "ds_resumen": ds_resumen,
        "no_puntos": no_puntos,
        "fe_inicio": fe_inicio,
        "fe_fin": fe_fin,
        "ds_imagen": ds_imagen,
        "ds_color": ds_color,
        "fg_tipo": fg_tipo,
        "fl_evaluacion": fl_evaluacion,
        "fg_estatus_usuario_reto": fg_estatus_usuario_reto,
      };
}
