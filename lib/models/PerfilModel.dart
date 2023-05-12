// To parse this JSON data, do
//
//     final perfilModel = perfilModelFromJson(jsonString);

import 'dart:convert';

PerfilModel perfilModelFromJson(String str) =>
    PerfilModel.fromJson(json.decode(str));

String perfilModelToJson(PerfilModel data) => json.encode(data.toJson());

class PerfilModel {
  PerfilModel({
    required this.usuario,
  });

  Usuario usuario;

  factory PerfilModel.fromJson(Map<String, dynamic> json) => PerfilModel(
        usuario: Usuario.fromJson(json["usuario"]),
      );

  Map<String, dynamic> toJson() => {
        "usuario": usuario == null ? null : usuario.toJson(),
      };
}

class Usuario {
  Usuario({
    required this.flUsuario,
    required this.flPerfil,
    required this.dsLogin,
    required this.dsPassword,
    required this.dsRfc,
    required this.clSesion,
    required this.dsNombres,
    required this.dsApaterno,
    required this.dsAmaterno,
    required this.dsEmail,
    required this.dsAvatar,
    required this.fgActivo,
    required this.feAlta,
    required this.feUltacc,
    required this.noAccesos,
    required this.noEmpleado,
    required this.dsPuesto,
    required this.dsImc,
    required this.indBienestar,
    required this.indSueno,
    required this.flEquipo,
    required this.createdAt,
    required this.updatedAt,
  });

  int flUsuario;
  int flPerfil;
  String dsLogin;
  String dsPassword;
  String dsRfc;
  String clSesion;
  String dsNombres;
  String dsApaterno;
  dynamic dsAmaterno;
  String dsEmail;
  dynamic dsAvatar;
  String fgActivo;
  DateTime feAlta;
  DateTime feUltacc;
  int noAccesos;
  dynamic noEmpleado;
  dynamic dsPuesto;
  dynamic dsImc;
  dynamic indBienestar;
  dynamic indSueno;
  dynamic flEquipo;
  DateTime createdAt;
  DateTime updatedAt;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        flUsuario: json["fl_usuario"] == null ? 0 : json["fl_usuario"],
        flPerfil: json["fl_perfil"] == null ? 0 : json["fl_perfil"],
        dsLogin: json["ds_login"] == null ? "" : json["ds_login"],
        dsPassword: json["ds_password"] == null ? "" : json["ds_password"],
        dsRfc: json["ds_rfc"] == null ? "-" : json["ds_rfc"],
        clSesion: json["cl_sesion"] == null ? "" : json["cl_sesion"],
        dsNombres: json["ds_nombres"] == null ? "" : json["ds_nombres"],
        dsApaterno: json["ds_apaterno"] == null ? "" : json["ds_apaterno"],
        dsAmaterno: json["ds_amaterno"],
        dsEmail: json["ds_email"] == null ? "" : json["ds_email"],
        dsAvatar: json["ds_avatar"],
        fgActivo: json["fg_activo"] == null ? "" : json["fg_activo"],
        feAlta: json["fe_alta"] == null
            ? DateTime.now()
            : DateTime.parse(json["fe_alta"]),
        feUltacc: json["fe_ultacc"] == null
            ? DateTime.now()
            : DateTime.parse(json["fe_ultacc"]),
        noAccesos: json["no_accesos"] == null ? "-" : json["no_accesos"],
        noEmpleado: json["no_empleado"] == null ? "-" : json["no_empleado"],
        dsPuesto: json["ds_puesto"] == null ? "-" : json["ds_puesto"],
        dsImc: json["ds_imc"] == null ? "-" : json["ds_imc"],
        indBienestar:
            json["ind_bienestar"] == null ? "-" : json["ind_bienestar"],
        indSueno: json["ind_sueno"] == null ? "-" : json["ind_sueno"],
        flEquipo: json["fl_equipo"] == null ? "-" : json["fl_equipo"],
        createdAt: json["created_at"] == null
            ? DateTime.now()
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? DateTime.now()
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "fl_usuario": flUsuario == null ? null : flUsuario,
        "fl_perfil": flPerfil == null ? null : flPerfil,
        "ds_login": dsLogin == null ? null : dsLogin,
        "ds_password": dsPassword == null ? null : dsPassword,
        "ds_rfc": dsRfc == null ? null : dsRfc,
        "cl_sesion": clSesion == null ? null : clSesion,
        "ds_nombres": dsNombres == null ? null : dsNombres,
        "ds_apaterno": dsApaterno == null ? null : dsApaterno,
        "ds_amaterno": dsAmaterno,
        "ds_email": dsEmail == null ? null : dsEmail,
        "ds_avatar": dsAvatar,
        "fg_activo": fgActivo == null ? null : fgActivo,
        "fe_alta": feAlta == null ? null : feAlta.toIso8601String(),
        "fe_ultacc": feUltacc == null ? null : feUltacc.toIso8601String(),
        "no_accesos": noAccesos == null ? null : noAccesos,
        "no_empleado": noEmpleado,
        "ds_puesto": dsPuesto,
        "ds_imc": dsImc,
        "ind_bienestar": indBienestar,
        "ind_sueno": indSueno,
        "fl_equipo": flEquipo,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}
