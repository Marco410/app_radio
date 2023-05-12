//import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:global_configuration/global_configuration.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mtm/Models/UserModel.dart';
import 'package:mtm/models/CategoriaModel.dart';
import 'package:mtm/models/MiEquipoModel.dart';
import 'package:mtm/models/PerfilModel.dart';
import 'package:mtm/models/RetosModel.dart';
import 'package:mtm/share_prefs/prefs_usuario.dart';

class PerfilService extends ChangeNotifier {
  final prefs = new PreferenciasUsuario();
  final storage = new FlutterSecureStorage();

  final String _baseUrl = GlobalConfiguration().getValue('base_url');

  late Usuario perfil = new Usuario(
      flUsuario: 0,
      flPerfil: 0,
      dsLogin: "",
      dsPassword: "",
      dsRfc: "",
      clSesion: "",
      dsNombres: "",
      dsApaterno: "",
      dsAmaterno: "",
      dsEmail: "",
      dsAvatar: "",
      fgActivo: "",
      feAlta: DateTime.now(),
      feUltacc: DateTime.now(),
      noAccesos: 0,
      noEmpleado: "",
      dsPuesto: "",
      dsImc: "",
      indBienestar: "",
      indSueno: "",
      flEquipo: "",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now());
  Usuario get usuarioGet => this.perfil;

  Future<String> callAPIWS(_urlBase, _urlBaseCall, _token) async {
    final url = Uri.https(_urlBase, _urlBaseCall);
    Map<String, String> userHeader = {
      "Content-type": "application/json",
      "Accept": "*/*",
      'Authorization': 'Bearer $_token',
    };
    final resp = await http.get(url, headers: userHeader);
    return resp.body;
  }

  get_perfil() async {
    /* String? _token = (await storage.read(key: "tokenAuth"));

    if (_token == null) {
      return "Logout";
    }

    var _urlFinal = _baseUrlPerfil + prefs.fl_usuario;
    var resp = await callAPIWS(_baseUrl, _urlFinal, _token);
    final Map<String, dynamic> decodedResp = json.decode(resp);

    if (decodedResp['description'] == "El token ha expirado.") {
      return 'TokenExpiro';
    }

    final perfilResponse = perfilModelFromJson(resp);
    this.perfil = perfilResponse.usuario; */
    notifyListeners();
  }
}
