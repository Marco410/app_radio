// To parse this JSON data, do
//
//     final resultVotacionModel = resultVotacionModelFromJson(jsonString);

import 'dart:convert';

ResultVotacionModel resultVotacionModelFromJson(String str) =>
    ResultVotacionModel.fromJson(json.decode(str));

String resultVotacionModelToJson(ResultVotacionModel data) =>
    json.encode(data.toJson());

class ResultVotacionModel {
  ResultVotacionModel({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  dynamic message;
  Data data;

  factory ResultVotacionModel.fromJson(Map<String, dynamic> json) =>
      ResultVotacionModel(
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
    required this.candidato,
    required this.primerosLugares,
  });

  CandidatoR candidato;
  List<CandidatoR> primerosLugares;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        candidato: CandidatoR.fromJson(
            json["candidato"] == null ? {} : json["candidato"]),
        primerosLugares: List<CandidatoR>.from(
            json["primeros_lugares"].map((x) => CandidatoR.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "candidato": candidato.toJson(),
        "primeros_lugares":
            List<dynamic>.from(primerosLugares.map((x) => x.toJson())),
      };
}

class CandidatoR {
  CandidatoR({
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
  });

  int flUsuario;
  String dsNombre;
  String dsRfc;
  int noEmpleado;
  String fgActivo;
  DateTime feAlta;
  dynamic feUltacc;
  int noAccesos;
  String fgConfirmado;
  dynamic feConfirmado;
  String fgCheckin;
  dynamic feCheckin;
  String fgBienvenida;

  factory CandidatoR.fromJson(Map<String, dynamic> json) => CandidatoR(
        flUsuario: json["fl_usuario"] ?? 0,
        dsNombre: json["ds_nombre"] ?? "",
        dsRfc: json["ds_rfc"] ?? "",
        noEmpleado: json["no_empleado"] ?? 0,
        fgActivo: json["fg_activo"] ?? "",
        feAlta: DateTime.parse(json["fe_alta"] ?? DateTime.now().toString()),
        feUltacc: json["fe_ultacc"] ?? DateTime.now(),
        noAccesos: json["no_accesos"] ?? 0,
        fgConfirmado: json["fg_confirmado"] ?? "",
        feConfirmado: json["fe_confirmado"] ?? DateTime.now(),
        fgCheckin: json["fg_checkin"] ?? "",
        feCheckin: json["fe_checkin"] ?? DateTime.now(),
        fgBienvenida: json["fg_bienvenida"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "fl_usuario": flUsuario,
        "ds_nombre": dsNombre,
        "ds_rfc": dsRfc,
        "no_empleado": noEmpleado,
        "fg_activo": fgActivo,
        "fe_alta": feAlta.toIso8601String(),
        "fe_ultacc": feUltacc,
        "no_accesos": noAccesos,
        "fg_confirmado": fgConfirmado,
        "fe_confirmado": feConfirmado,
        "fg_checkin": fgCheckin,
        "fe_checkin": feCheckin,
        "fg_bienvenida": fgBienvenida,
      };
}
