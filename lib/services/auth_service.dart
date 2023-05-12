//import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:global_configuration/global_configuration.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mtm/Models/UserModel.dart';
import 'package:mtm/models/MiEquipoModel.dart';
import 'package:mtm/share_prefs/prefs_usuario.dart';

import 'notification_service.dart';

class AuthService extends ChangeNotifier {
  final prefs = new PreferenciasUsuario();

  final String _baseUrl = GlobalConfiguration().getValue('base_url');
  final String _baseUrlLogin = GlobalConfiguration().getValue('login');
  final String _baseUrlCheckIn = GlobalConfiguration().getValue('check-in');
  final String _deleteAccount = GlobalConfiguration().getValue('limpiar_datos');
  final String _statusCheckInUrl =
      GlobalConfiguration().getValue('status_check_in');

  final String _saveTokenUrl =
      GlobalConfiguration().getValue('save_token_firebase');

  AuthService() {
    this.get_open_checkin();
    this.save_token_firebase();
  }

  final storage = new FlutterSecureStorage();
  late User authUser;

  Future<Map<String, dynamic>> callAPIWS(_urlBase, _urlBaseCall, _data) async {
    final url = Uri.https(_urlBase, _urlBaseCall);
    Map<String, String> userHeader = {
      "Content-type": "application/json",
      "Accept": "*/*"
    };
    final resp =
        await http.post(url, body: json.encode(_data), headers: userHeader);

    final Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(resp.body);

    return decodedResp;
  }

  Future<String> callAPIWSGet(_urlBase, _urlBaseCall, _token) async {
    final url = Uri.https(_urlBase, _urlBaseCall);
    Map<String, String> userHeader = {
      "Content-type": "application/json",
      "Accept": "*/*",
      'Authorization': 'Bearer $_token',
    };
    final resp = await http.get(url, headers: userHeader);
    return resp.body;
  }

  Future<Map<String, dynamic>> callAPIWSPost(
      _urlBase, _urlBaseCall, _token, _data) async {
    final url = Uri.https(_urlBase, _urlBaseCall);
    Map<String, String> userHeader = {
      "Content-type": "application/json",
      "Accept": "*/*",
      'Authorization': 'Bearer $_token',
    };
    final resp =
        await http.post(url, body: json.encode(_data), headers: userHeader);
    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    return decodedResp;
  }

  Future<String?> login(String? no_empleado, String? rfc) async {
    final Map<String, dynamic> authData = {
      "no_empleado": no_empleado,
      "ds_rfc": rfc
    };

    var resp = await callAPIWS(_baseUrl, _baseUrlLogin, authData);

    if (resp["status"] == 'Success') {
      await storage.write(
          key: 'tokenAuth', value: resp['data']['authorization']['token']);
      prefs.fl_usuario = resp['data']['user']['fl_usuario'].toString();
      prefs.ds_nombre = resp['data']['user']['ds_nombre'].toString();
      prefs.ds_rfc = resp['data']['user']['ds_rfc'].toString();
      prefs.no_empleado = resp['data']['user']['no_empleado'].toString();
      prefs.fg_activo = resp['data']['user']['fg_activo'].toString();
      prefs.fe_alta = resp['data']['user']['fe_alta'].toString();
      prefs.fe_ultacc = resp['data']['user']['fe_ultacc'].toString();
      prefs.no_accesos = resp['data']['user']['no_accesos'].toString();
      prefs.fg_confirmado = resp['data']['user']['fg_confirmado'].toString();
      prefs.fe_confirmado = resp['data']['user']['fe_confirmado'].toString();
      prefs.fg_checkin = resp['data']['user']['fg_checkin'].toString();
      prefs.fe_checkin = resp['data']['user']['fe_checkin'].toString();
      prefs.fg_bienvenida = resp['data']['user']['fg_bienvenida'].toString();
      //prefs.fl_perfil = "2";
      prefs.fl_perfil = resp['data']['user']['fl_perfil'].toString();
      prefs.nombre_corto = resp['data']['user']['nombre_corto'].toString();
      prefs.nombre_largo = resp['data']['user']['nombre_largo'].toString();
      return null;
    } else {
      return resp["message"];
    }
  }

  register(String? email, String empresa, String? password) async {
    final Map<String, dynamic> registerData = {
      "ds_correo": email,
      "ds_empresa": empresa,
      "ds_contrasena": password
    };

    var resp = await callAPIWS('clientes.loomtek.mx',
        '/api_app_bienestar/api/app/solicitud/registro', registerData);

    if (resp["description"] != null) {
      return resp["description"];
    } else {
      return "Registro Correcto";
    }
  }

  Future<String?> check_in() async {
    String? _token = (await storage.read(key: "tokenAuth"));

    final Map<String, dynamic> data = {
      'fl_usuario': prefs.fl_usuario,
    };

    var resp = await callAPIWSPost(_baseUrl, _baseUrlCheckIn, _token, data);
    if (resp['status'] == 'Success') {
      prefs.fg_checkin = "1";
    }
    return resp['ds_mensaje'];
  }

  User get selectedAuthUser => this.authUser;

  set selectedAthUser(User valor) {
    this.authUser = valor;
    notifyListeners();
  }

  Future logout() async {
    await storage.delete(key: "tokenAuth");
    await prefs.borrar();
    this.forzarCierreSession = false;
    notifyListeners();
  }

  Future<String> isAuth() async {
    return await storage.read(key: "tokenAuth") ?? '';
  }

  Future<String?> delete_data() async {
    String? _token = (await storage.read(key: "tokenAuth"));

    final Map<String, dynamic> deleteData = {
      "fl_usuario": prefs.fl_usuario,
    };

    var resp =
        await callAPIWSPost(_baseUrl, _deleteAccount, _token, deleteData);

    notifyListeners();
  }

  String statusCheckIn = "CERRADO";
  String get statusCheckInGet => this.statusCheckIn;

  bool forzarCierreSession = false;
  bool get forzarCierreSessionGet => this.forzarCierreSession;

  get_open_checkin() async {
    String? _token = (await storage.read(key: "tokenAuth"));

    var resp = await callAPIWSGet(_baseUrl, _statusCheckInUrl, _token);
    final Map<String, dynamic> decodedResp = json.decode(resp);

    if (decodedResp['status'] == "Success") {
      this.statusCheckIn = decodedResp['data']['estatus_modulo'];
    }
    this.forzarCierreSession = decodedResp['data']['forzar_cierre_sesion'];
    notifyListeners();
  }

  save_token_firebase() async {
    String? _token = (await storage.read(key: "tokenAuth"));

    final Map<String, dynamic> _data = {
      "fl_usuario": prefs.fl_usuario,
      "token": prefs.token_firebase
    };

    var resp = await callAPIWSPost(_baseUrl, _saveTokenUrl, _token, _data);

    notifyListeners();
  }
}
