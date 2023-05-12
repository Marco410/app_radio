// To parse this JSON data, do
//
//     final regaloModel = regaloModelFromJson(jsonString);

import 'dart:convert';

RegaloModel regaloModelFromJson(String str) =>
    RegaloModel.fromJson(json.decode(str));

String regaloModelToJson(RegaloModel data) => json.encode(data.toJson());

class RegaloModel {
  RegaloModel({
    required this.status,
    this.message,
    required this.data,
  });

  String status;
  dynamic message;
  Data data;

  factory RegaloModel.fromJson(Map<String, dynamic> json) => RegaloModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.regalos,
  });

  List<Regalo> regalos;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        regalos:
            List<Regalo>.from(json["regalos"].map((x) => Regalo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "regalos": List<dynamic>.from(regalos.map((x) => x.toJson())),
      };
}

class Regalo {
  Regalo({
    required this.flRegalo,
    required this.nbRegalo,
    required this.dsRegalo,
    required this.nbImagen,
    required this.nbImagen2,
    required this.nbImagen3,
    required this.fgActivo,
    required this.feAlta,
    required this.feUlmod,
  });

  int flRegalo;
  String nbRegalo;
  String dsRegalo;
  String nbImagen;
  String nbImagen2;
  String nbImagen3;
  String fgActivo;
  DateTime feAlta;
  DateTime feUlmod;

  factory Regalo.fromJson(Map<String, dynamic> json) => Regalo(
        flRegalo: json["fl_regalo"],
        nbRegalo: json["nb_regalo"],
        dsRegalo: json["ds_regalo"],
        nbImagen: json["nb_imagen"],
        nbImagen2: json["nb_imagen_2"] == null ? "" : json["nb_imagen_2"],
        nbImagen3: json["nb_imagen_3"] == null ? "" : json["nb_imagen_3"],
        fgActivo: json["fg_activo"],
        feAlta: DateTime.parse(json["fe_alta"]),
        feUlmod: DateTime.parse(json["fe_ulmod"]),
      );

  Map<String, dynamic> toJson() => {
        "fl_regalo": flRegalo,
        "nb_regalo": nbRegalo,
        "ds_regalo": dsRegalo,
        "nb_imagen": nbImagen,
        "nb_imagen_2": nbImagen2 == null ? "" : nbImagen2,
        "nb_imagen_3": nbImagen3 == null ? "" : nbImagen3,
        "fg_activo": fgActivo,
        "fe_alta": feAlta.toIso8601String(),
        "fe_ulmod": feUlmod.toIso8601String(),
      };
}
