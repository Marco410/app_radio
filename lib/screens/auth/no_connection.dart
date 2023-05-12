import 'dart:ui';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:mtm/constants/Theme.dart';
import 'package:mtm/routes/routes.dart';
import 'package:mtm/services/notification_service.dart';
import 'package:mtm/setting/style.dart';
import 'package:provider/provider.dart';

import '../../services/auth_service.dart';
import '../../services/load_data.dart';
import '../../share_prefs/prefs_usuario.dart';

class NoConnection extends StatefulWidget {
  @override
  _NoConnectionState createState() => _NoConnectionState();
}

class _NoConnectionState extends State<NoConnection> {
  final Connectivity connectivity = Connectivity();
  bool connected = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final storage = new FlutterSecureStorage();
    final prefs = new PreferenciasUsuario();

    return Scaffold(
        backgroundColor: MaterialColors.bgColorScreen,
        body: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "No tienes conexión",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Checa tu conexión para poder continuar",
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Icon(
                      Icons.wifi_off,
                      color: Colors.blue,
                      size: 100,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: ElevatedButton(
                        onPressed: () async {
                          final connectivityStatus =
                              await connectivity.checkConnectivity();
                          if (connectivityStatus == ConnectivityResult.none) {
                            NotificationService.showSnackBarConnectionError(
                                "Aún no pudimos conectarnos", context);
                          } else {
                            String _token =
                                (await storage.read(key: "tokenAuth")) ?? '';
                            if (prefs.fl_usuario != "" || _token != "") {
                              final loadDataService =
                                  Provider.of<LoadDataService>(context,
                                      listen: false);
                              final String? resp =
                                  await loadDataService.load_data(context);

                              Navigator.pushReplacementNamed(
                                  context, PageRoutes.home);
                            } else {
                              Navigator.pushReplacementNamed(
                                  context, PageRoutes.login);
                            }
                          }
                        },
                        child: Text(
                          'Intentar de nuevo',
                          style: TextStyle(fontSize: 16),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black54,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(8), // <-- Radius
                          ),
                        ),
                      ),
                    ),
                  ]),
            )));
  }

  Future<void> getConnectivity() async {
    final connectivityStatus = await connectivity.checkConnectivity();

    if (connectivityStatus == ConnectivityResult.none) {
      setState(() {
        connected = false;
      });
    } else {
      setState(() {
        connected = true;
      });
    }
  }
}
