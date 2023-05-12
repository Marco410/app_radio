import 'package:flutter/material.dart';
import 'package:mtm/services/perfil_service.dart';
import 'package:mtm/services/radio_service.dart';
import 'package:mtm/share_prefs/prefs_usuario.dart';
import 'package:provider/provider.dart';

class LoadDataService extends ChangeNotifier {
  load_data(BuildContext context) async {
    final prefs = new PreferenciasUsuario();

    final perfilService = Provider.of<PerfilService>(context, listen: false);

    final String? resp = await perfilService.get_perfil();
    perfilService.get_perfil();
    print(resp);

    if (resp == "Logout") {
      return "Logout";
    }
  }
}
