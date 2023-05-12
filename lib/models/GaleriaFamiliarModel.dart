// To parse this JSON data, do
//
//     final galeriaFamiliarModel = galeriaFamiliarModelFromJson(jsonString);

import 'dart:convert';

GaleriaFamiliarModel galeriaFamiliarModelFromJson(String str) =>
    GaleriaFamiliarModel.fromJson(json.decode(str));

String galeriaFamiliarModelToJson(GaleriaFamiliarModel data) =>
    json.encode(data.toJson());

class GaleriaFamiliarModel {
  GaleriaFamiliarModel({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  dynamic message;
  Data data;

  factory GaleriaFamiliarModel.fromJson(Map<String, dynamic> json) =>
      GaleriaFamiliarModel(
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
  Data(
      {required this.galeriaFamiliar,
      required this.imgFamiliaResirene,
      required this.carpetaWebGaleria,
      required this.yaSeleccionFotoFamiliar});

  List<GaleriaFamiliar> galeriaFamiliar;
  String imgFamiliaResirene;
  String carpetaWebGaleria;
  bool yaSeleccionFotoFamiliar;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        galeriaFamiliar: List<GaleriaFamiliar>.from(
            json["galeria"].map((x) => GaleriaFamiliar.fromJson(x))),
        imgFamiliaResirene: json["img_familia_resirene"],
        carpetaWebGaleria: json["carpeta_web_galeria"],
        yaSeleccionFotoFamiliar: json["ya_selecciono_foto_familiar"],
      );

  Map<String, dynamic> toJson() => {
        "galeria": List<dynamic>.from(galeriaFamiliar.map((x) => x.toJson())),
        "img_familia_resirene": imgFamiliaResirene,
        "carpeta_web_galeria": carpetaWebGaleria,
        "ya_selecciono_foto_familiar": yaSeleccionFotoFamiliar,
      };
}

class GaleriaFamiliar {
  GaleriaFamiliar({
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
    required this.yaDioLike,
    required this.fotoSeleccionada,
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
  dynamic yaDioLike;
  String fotoSeleccionada;

  factory GaleriaFamiliar.fromJson(Map<String, dynamic> json) =>
      GaleriaFamiliar(
        flGaleria: json["fl_galeria"],
        flUsuario: json["fl_usuario"],
        nbImagen: json["nb_imagen"],
        clCategoria: json["cl_categoria"],
        feAlta: json["fe_alta"] == null
            ? DateTime.now()
            : DateTime.parse(json["fe_alta"]),
        fgPublica: json["fg_publica"],
        fgPermiteLike: json["fg_permite_like"],
        fgPermiteComentarios: json["fg_permite_comentarios"],
        likesCount: json["likes_count"],
        comentariosCount: json["comentarios_count"],
        yaDioLike: json["ya_dio_like"],
        fotoSeleccionada: json["foto_seleccionada"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "fl_galeria": flGaleria,
        "fl_usuario": flUsuario,
        "nb_imagen": nbImagen,
        "cl_categoria": clCategoria,
        "fe_alta": feAlta == null ? null : feAlta.toIso8601String(),
        "fg_publica": fgPublica,
        "fg_permite_like": fgPermiteLike,
        "fg_permite_comentarios": fgPermiteComentarios,
        "likes_count": likesCount,
        "comentarios_count": comentariosCount,
        "ya_dio_like": yaDioLike,
        "foto_seleccionada": fotoSeleccionada,
      };
}
