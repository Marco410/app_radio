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

class SettingService extends ChangeNotifier {
  final prefs = new PreferenciasUsuario();
  final storage = new FlutterSecureStorage();

  String title = "Inicio";
  String get titleGet => this.title;
  set titleSet(String valor) {
    this.title = valor;
    notifyListeners();
  }
}
