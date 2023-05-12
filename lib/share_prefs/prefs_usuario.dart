import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario with ChangeNotifier {
  //se hace una unica instancia de las preferencias del usuario
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }
  PreferenciasUsuario._internal();
  SharedPreferences? _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  String get fl_usuario {
    return _prefs!.getString('fl_usuario') ?? "";
  }

  set fl_usuario(String value) {
    _prefs!.setString('fl_usuario', value);
  }

  String get ds_nombre {
    return _prefs!.getString('ds_nombre') ?? "";
  }

  set ds_nombre(String value) {
    _prefs!.setString('ds_nombre', value);
  }

  String get ds_rfc {
    return _prefs!.getString('ds_rfc') ?? "";
  }

  set ds_rfc(String value) {
    _prefs!.setString('ds_rfc', value);
  }

  String get fg_activo {
    return _prefs!.getString('fg_activo') ?? "";
  }

  set fg_activo(String value) {
    _prefs!.setString('fg_activo', value);
  }

  String get fe_alta {
    return _prefs!.getString('fe_alta') ?? "";
  }

  set fe_alta(String value) {
    _prefs!.setString('fe_alta', value);
  }

  String get fe_ultacc {
    return _prefs!.getString('fe_ultacc') ?? "";
  }

  set fe_ultacc(String value) {
    _prefs!.setString('fe_ultacc', value);
  }

  String get no_accesos {
    return _prefs!.getString('no_accesos') ?? "";
  }

  set no_accesos(String value) {
    _prefs!.setString('no_accesos', value);
  }

  String get no_empleado {
    return _prefs!.getString('no_empleado') ?? "";
  }

  set no_empleado(String value) {
    _prefs!.setString('no_empleado', value);
  }

  String get fg_confirmado {
    return _prefs!.getString('fg_confirmado') ?? "";
  }

  set fg_confirmado(String value) {
    _prefs!.setString('fg_confirmado', value);
  }

  String get fe_confirmado {
    return _prefs!.getString('fe_confirmado') ?? "";
  }

  set fe_confirmado(String value) {
    _prefs!.setString('fe_confirmado', value);
  }

  String get fg_checkin {
    return _prefs!.getString('fg_checkin') ?? "";
  }

  set fg_checkin(String value) {
    _prefs!.setString('fg_checkin', value);
  }

  String get fe_checkin {
    return _prefs!.getString('fe_checkin') ?? "";
  }

  set fe_checkin(String value) {
    _prefs!.setString('fe_checkin', value);
  }

  String get fg_bienvenida {
    return _prefs!.getString('fg_bienvenida') ?? "";
  }

  set fg_bienvenida(String value) {
    _prefs!.setString('fg_bienvenida', value);
  }

  String get fl_perfil {
    return _prefs!.getString('fl_perfil') ?? "";
  }

  set fl_perfil(String value) {
    _prefs!.setString('fl_perfil', value);
  }

  String get nombre_corto {
    return _prefs!.getString('nombre_corto') ?? "";
  }

  set nombre_corto(String value) {
    _prefs!.setString('nombre_corto', value);
  }

  String get nombre_largo {
    return _prefs!.getString('nombre_largo') ?? "";
  }

  set nombre_largo(String value) {
    _prefs!.setString('nombre_largo', value);
  }

  String get token_firebase {
    return _prefs!.getString('token_firebase') ?? "";
  }

  set token_firebase(String value) {
    _prefs!.setString('token_firebase', value);
  }

  Future borrar() async {
    _prefs!.clear();
  }
}
