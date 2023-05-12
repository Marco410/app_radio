// To parse this JSON data, do
//
//     final galeriaPostModel = galeriaPostModelFromJson(jsonString);

import 'dart:convert';

GaleriaPostModel galeriaPostModelFromJson(String str) =>
    GaleriaPostModel.fromJson(json.decode(str));

String galeriaPostModelToJson(GaleriaPostModel data) =>
    json.encode(data.toJson());

class GaleriaPostModel {
  GaleriaPostModel({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  dynamic message;
  Data data;

  factory GaleriaPostModel.fromJson(Map<String, dynamic> json) =>
      GaleriaPostModel(
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
    required this.galeriaPost,
    required this.carpetaWebGaleria,
  });

  List<GaleriaPost> galeriaPost;
  String carpetaWebGaleria;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        galeriaPost: List<GaleriaPost>.from(
            json["galeria"].map((x) => GaleriaPost.fromJson(x))),
        carpetaWebGaleria: json["carpeta_web_galeria"],
      );

  Map<String, dynamic> toJson() => {
        "galeria": List<dynamic>.from(galeriaPost.map((x) => x.toJson())),
        "carpeta_web_galeria": carpetaWebGaleria,
      };
}

class GaleriaPost {
  GaleriaPost({
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
    required this.comentarios,
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
  bool yaDioLike;
  List<Comentario> comentarios;

  factory GaleriaPost.fromJson(Map<String, dynamic> json) => GaleriaPost(
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
        yaDioLike: json["ya_dio_like"],
        comentarios: List<Comentario>.from(
            json["comentarios"].map((x) => Comentario.fromJson(x))),
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
        "ya_dio_like": yaDioLike,
        "comentarios": List<dynamic>.from(comentarios.map((x) => x.toJson())),
      };
}

class Comentario {
  Comentario({
    required this.flGaleriaComentario,
    required this.flGaleria,
    required this.flUsuario,
    required this.dsComentario,
    required this.feRegistro,
    required this.usuario,
  });

  int flGaleriaComentario;
  int flGaleria;
  int flUsuario;
  String dsComentario;
  DateTime feRegistro;
  Usuario usuario;

  factory Comentario.fromJson(Map<String, dynamic> json) => Comentario(
        flGaleriaComentario: json["fl_galeria_comentario"],
        flGaleria: json["fl_galeria"],
        flUsuario: json["fl_usuario"],
        dsComentario: json["ds_comentario"],
        feRegistro: DateTime.parse(json["fe_registro"]),
        usuario: Usuario.fromJson(json["usuario"]),
      );

  Map<String, dynamic> toJson() => {
        "fl_galeria_comentario": flGaleriaComentario,
        "fl_galeria": flGaleria,
        "fl_usuario": flUsuario,
        "ds_comentario": dsComentario,
        "fe_registro": feRegistro.toIso8601String(),
        "usuario": usuario.toJson(),
      };
}

class Usuario {
  Usuario({
    required this.flUsuario,
    required this.dsNombre,
    required this.dsRfc,
    required this.noEmpleado,
    required this.fgActivo,
    required this.feAlta,
    required this.feUltacc,
    required this.noAccesos,
    required this.fgConfirmado,
    required this.feConfirmado,
    required this.fgCheckin,
    required this.feCheckin,
    required this.fgBienvenida,
    required this.noAccesosApp,
    required this.fgConfirmoRegalos,
    required this.feConfirmoRegalos,
    required this.dsNombreCorto,
    required this.flPerfil,
    required this.fgDescargaApp,
    required this.feDescargaApp,
    required this.dsTokenNotificacion,
    required this.nombreCorto,
    required this.nombreLargo,
  });

  int flUsuario;
  String dsNombre;
  String dsRfc;
  int noEmpleado;
  String fgActivo;
  DateTime feAlta;
  DateTime feUltacc;
  int noAccesos;
  String fgConfirmado;
  DateTime feConfirmado;
  String fgCheckin;
  DateTime feCheckin;
  String fgBienvenida;
  int noAccesosApp;
  String fgConfirmoRegalos;
  DateTime feConfirmoRegalos;
  String dsNombreCorto;
  int flPerfil;
  String fgDescargaApp;
  dynamic feDescargaApp;
  String dsTokenNotificacion;
  String nombreCorto;
  String nombreLargo;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        flUsuario: json["fl_usuario"],
        dsNombre: json["ds_nombre"],
        dsRfc: json["ds_rfc"],
        noEmpleado: json["no_empleado"],
        fgActivo: json["fg_activo"],
        feAlta: DateTime.parse(json["fe_alta"]),
        feUltacc: json["fe_ultacc"] == null
            ? DateTime.now()
            : DateTime.parse(json["fe_ultacc"]),
        noAccesos: json["no_accesos"],
        fgConfirmado: json["fg_confirmado"],
        feConfirmado: json["fe_confirmado"] == null
            ? DateTime.now()
            : DateTime.parse(json["fe_confirmado"]),
        fgCheckin: json["fg_checkin"],
        feCheckin: json["fe_checkin"] == null
            ? DateTime.now()
            : DateTime.parse(json["fe_checkin"]),
        fgBienvenida: json["fg_bienvenida"],
        noAccesosApp: json["no_accesos_app"],
        fgConfirmoRegalos: json["fg_confirmo_regalos"],
        feConfirmoRegalos: json["fe_confirmo_regalos"] == null
            ? DateTime.now()
            : DateTime.parse(json["fe_confirmo_regalos"]),
        dsNombreCorto: json["ds_nombre_corto"],
        flPerfil: json["fl_perfil"],
        fgDescargaApp: json["fg_descarga_app"],
        feDescargaApp: json["fe_descarga_app"],
        dsTokenNotificacion: json["ds_token_notificacion"] == null
            ? ""
            : json["ds_token_notificacion"],
        nombreCorto: json["nombre_corto"],
        nombreLargo: json["nombre_largo"],
      );

  Map<String, dynamic> toJson() => {
        "fl_usuario": flUsuario,
        "ds_nombre": dsNombre,
        "ds_rfc": dsRfc,
        "no_empleado": noEmpleado,
        "fg_activo": fgActivo,
        "fe_alta": feAlta.toIso8601String(),
        "fe_ultacc": feUltacc == null ? null : feUltacc.toIso8601String(),
        "no_accesos": noAccesos,
        "fg_confirmado": fgConfirmado,
        "fe_confirmado":
            feConfirmado == null ? null : feConfirmado.toIso8601String(),
        "fg_checkin": fgCheckin,
        "fe_checkin": feCheckin == null ? null : feCheckin.toIso8601String(),
        "fg_bienvenida": fgBienvenida,
        "no_accesos_app": noAccesosApp,
        "fg_confirmo_regalos": fgConfirmoRegalos,
        "fe_confirmo_regalos": feConfirmoRegalos == null
            ? null
            : feConfirmoRegalos.toIso8601String(),
        "ds_nombre_corto": dsNombreCorto,
        "fl_perfil": flPerfil,
        "fg_descarga_app": fgDescargaApp,
        "fe_descarga_app": feDescargaApp,
        "ds_token_notificacion":
            dsTokenNotificacion == null ? null : dsTokenNotificacion,
        "nombre_corto": nombreCorto,
        "nombre_largo": nombreLargo,
      };
}
