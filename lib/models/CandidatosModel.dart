// To parse this JSON data, do
//
//     final candidatosModel = candidatosModelFromJson(jsonString);

import 'dart:convert';

CandidatosModel candidatosModelFromJson(String str) =>
    CandidatosModel.fromJson(json.decode(str));

String candidatosModelToJson(CandidatosModel data) =>
    json.encode(data.toJson());

class CandidatosModel {
  CandidatosModel({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  dynamic message;
  Data data;

  factory CandidatosModel.fromJson(Map<String, dynamic> json) =>
      CandidatosModel(
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
    required this.candidatos,
  });

  List<Candidato> candidatos;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        candidatos: List<Candidato>.from(
            json["candidatos"].map((x) => Candidato.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "candidatos": List<dynamic>.from(candidatos.map((x) => x.toJson())),
      };
}

class Candidato {
  Candidato({
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
    required this.nombre_corto,
    required this.nombre_largo,
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
  dynamic feCheckin;
  String fgBienvenida;
  String nombre_corto;
  String nombre_largo;

  factory Candidato.fromJson(Map<String, dynamic> json) => Candidato(
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
        feCheckin: json["fe_checkin"],
        fgBienvenida: json["fg_bienvenida"],
        nombre_corto: json["nombre_corto"],
        nombre_largo: json["nombre_largo"],
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
        "fe_checkin": feCheckin,
        "fg_bienvenida": fgBienvenida,
        "nombre_corto": nombre_corto,
        "nombre_largo": nombre_largo,
      };
}
