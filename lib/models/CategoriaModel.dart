// To parse this JSON data, do
//
//     final categoriaModel = categoriaModelFromJson(jsonString);

import 'dart:convert';

CategoriaModel categoriaModelFromJson(String str) =>
    CategoriaModel.fromJson(json.decode(str));

String categoriaModelToJson(CategoriaModel data) => json.encode(data.toJson());

class CategoriaModel {
  CategoriaModel({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  dynamic message;
  Data data;

  factory CategoriaModel.fromJson(Map<String, dynamic> json) => CategoriaModel(
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
    required this.categoriasVotacion,
  });

  List<CategoriasVotacion> categoriasVotacion;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        categoriasVotacion: List<CategoriasVotacion>.from(
            json["categorias_votacion"]
                .map((x) => CategoriasVotacion.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categorias_votacion":
            List<dynamic>.from(categoriasVotacion.map((x) => x.toJson())),
      };
}

class CategoriasVotacion {
  CategoriasVotacion({
    required this.flCategoriaVotacion,
    required this.nbCategoriaVotacion,
    required this.dsCategoriaVotacion,
    required this.noOrden,
    required this.fgActiva,
    required this.fgAbierta,
    required this.feIniVigencia,
    required this.feFinVigencia,
    required this.nbImagen,
    required this.feAlta,
    required this.feUlmod,
    required this.estaActiva,
    required this.yaVoto,
  });

  int flCategoriaVotacion;
  String nbCategoriaVotacion;
  String dsCategoriaVotacion;
  int noOrden;
  String fgActiva;
  String fgAbierta;
  String feIniVigencia;
  String feFinVigencia;
  String nbImagen;
  DateTime feAlta;
  DateTime feUlmod;
  int estaActiva;
  bool yaVoto;

  factory CategoriasVotacion.fromJson(Map<String, dynamic> json) =>
      CategoriasVotacion(
        flCategoriaVotacion: json["fl_categoria_votacion"],
        nbCategoriaVotacion: json["nb_categoria_votacion"],
        dsCategoriaVotacion: json["ds_categoria_votacion"],
        noOrden: json["no_orden"],
        fgActiva: json["fg_activa"],
        fgAbierta: json["fg_abierta"],
        feIniVigencia: json["fe_ini_vigencia"],
        feFinVigencia: json["fe_fin_vigencia"],
        nbImagen: json["nb_imagen"],
        feAlta: DateTime.parse(json["fe_alta"]),
        feUlmod: DateTime.parse(json["fe_ulmod"]),
        estaActiva: int.parse(json["esta_activa"]),
        yaVoto: json["ya_voto"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "fl_categoria_votacion": flCategoriaVotacion,
        "nb_categoria_votacion": nbCategoriaVotacion,
        "ds_categoria_votacion": dsCategoriaVotacion,
        "no_orden": noOrden,
        "fg_activa": fgActiva,
        "fg_abierta": fgAbierta,
        "fe_ini_vigencia": feIniVigencia,
        "fe_fin_vigencia": feFinVigencia,
        "nb_imagen": nbImagen,
        "fe_alta": feAlta.toIso8601String(),
        "fe_ulmod": feUlmod.toIso8601String(),
        "esta_activa": estaActiva,
        "ya_voto": yaVoto,
      };
}
