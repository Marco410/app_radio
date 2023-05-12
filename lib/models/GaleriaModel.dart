// To parse this JSON data, do
//
//     final galeriaModel = galeriaModelFromJson(jsonString);

import 'dart:convert';

GaleriaModel galeriaModelFromJson(String str) =>
    GaleriaModel.fromJson(json.decode(str));

String galeriaModelToJson(GaleriaModel data) => json.encode(data.toJson());

class GaleriaModel {
  GaleriaModel({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  dynamic message;
  Data data;

  factory GaleriaModel.fromJson(Map<String, dynamic> json) => GaleriaModel(
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
    required this.galeria,
    required this.carpetaWebGaleria,
  });

  List<Galeria> galeria;
  String carpetaWebGaleria;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        galeria:
            List<Galeria>.from(json["galeria"].map((x) => Galeria.fromJson(x))),
        carpetaWebGaleria: json["carpeta_web_galeria"],
      );

  Map<String, dynamic> toJson() => {
        "galeria": List<dynamic>.from(galeria.map((x) => x.toJson())),
        "carpeta_web_galeria": carpetaWebGaleria,
      };
}

class Galeria {
  Galeria({
    required this.flGaleria,
    required this.flUsuario,
    required this.nbImagen,
    required this.clCategoria,
    required this.feAlta,
    required this.fgPublica,
    required this.fgPermiteLike,
    required this.fgPermiteComentarios,
    required this.likesCount,
    required this.comentariosCount,
  });

  int flGaleria;
  int flUsuario;
  String nbImagen;
  int clCategoria;
  DateTime feAlta;
  String fgPublica;
  String fgPermiteLike;
  String fgPermiteComentarios;
  int likesCount;
  int comentariosCount;

  factory Galeria.fromJson(Map<String, dynamic> json) => Galeria(
        flGaleria: json["fl_galeria"],
        flUsuario: json["fl_usuario"],
        nbImagen: json["nb_imagen"],
        clCategoria: json["cl_categoria"],
        feAlta: DateTime.parse(json["fe_alta"]),
        fgPublica: json["fg_publica"],
        fgPermiteLike: json["fg_permite_like"],
        fgPermiteComentarios: json["fg_permite_comentarios"],
        likesCount: json["likes_count"],
        comentariosCount: json["comentarios_count"],
      );

  Map<String, dynamic> toJson() => {
        "fl_galeria": flGaleria,
        "fl_usuario": flUsuario,
        "nb_imagen": nbImagen,
        "cl_categoria": clCategoria,
        "fe_alta": feAlta.toIso8601String(),
        "fg_publica": fgPublica,
        "fg_permite_like": fgPermiteLike,
        "fg_permite_comentarios": fgPermiteComentarios,
        "likes_count": likesCount,
        "comentarios_count": comentariosCount,
      };
}
