// To parse this JSON data, do
//
//     final equipoModel = equipoModelFromJson(jsonString);

import 'dart:convert';

EquipoModel equipoModelFromJson(String str) =>
    EquipoModel.fromJson(json.decode(str));

String equipoModelToJson(EquipoModel data) => json.encode(data.toJson());

class EquipoModel {
  EquipoModel({
    required this.miEquipo,
    required this.infoDueno,
    required this.integrantes,
  });

  MiEquipo miEquipo;
  InfoDueno infoDueno;
  List<InfoDueno> integrantes;

  factory EquipoModel.fromJson(Map<String, dynamic> json) => EquipoModel(
        miEquipo: MiEquipo.fromJson(json["info_equipo"]),
        infoDueno: InfoDueno.fromJson(json["info_dueno"]),
        integrantes: List<InfoDueno>.from(
            json["integrantes"].map((x) => InfoDueno.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info_equipo": miEquipo.toJson(),
        "info_dueno": infoDueno.toJson(),
        "integrantes": List<dynamic>.from(integrantes.map((x) => x.toJson())),
      };
}

class InfoDueno {
  InfoDueno({
    required this.nombre,
    required this.flEquipo,
    required this.flUsuario,
    required this.fgEstado,
    required this.feInvitacion,
  });

  String nombre;
  int flEquipo;
  int flUsuario;
  String fgEstado;
  DateTime? feInvitacion;

  factory InfoDueno.fromJson(Map<String, dynamic> json) => InfoDueno(
        nombre: json["nombre"],
        flEquipo: json["fl_equipo"],
        flUsuario: json["fl_usuario"],
        fgEstado: json["fg_estado"],
        feInvitacion: json["fe_invitacion"] == null
            ? null
            : DateTime.parse(json["fe_invitacion"]),
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "fl_equipo": flEquipo,
        "fl_usuario": flUsuario,
        "fg_estado": fgEstado,
        "fe_invitacion":
            feInvitacion == null ? null : feInvitacion!.toIso8601String(),
      };
}

class MiEquipo {
  MiEquipo({
    required this.flEquipo,
    required this.flUsuario,
    required this.nbEquipo,
    required this.dsImagen,
    required this.feAlta,
    required this.noTotalPuntos,
    required this.createdAt,
    required this.updatedAt,
  });

  int flEquipo;
  int flUsuario;
  String nbEquipo;
  String dsImagen;
  DateTime feAlta;
  int noTotalPuntos;
  DateTime createdAt;
  DateTime updatedAt;

  factory MiEquipo.fromJson(Map<String, dynamic> json) => MiEquipo(
        flEquipo: json["fl_equipo"],
        flUsuario: json["fl_usuario"],
        nbEquipo: json["nb_equipo"],
        dsImagen: (json["ds_imagen"] == null) ? "" : json["ds_imagen"],
        feAlta: DateTime.parse(json["fe_alta"]),
        noTotalPuntos: json["no_total_puntos"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "fl_equipo": flEquipo,
        "fl_usuario": flUsuario,
        "nb_equipo": nbEquipo,
        "ds_imagen": dsImagen,
        "fe_alta": feAlta.toIso8601String(),
        "no_total_puntos": noTotalPuntos,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
