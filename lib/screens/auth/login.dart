import 'dart:io';
import 'dart:ui';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:mtm/constants/Theme.dart';
import 'package:mtm/routes/routes.dart';
import 'package:mtm/services/auth_service.dart';
import 'package:mtm/services/notification_service.dart';
import 'package:mtm/setting/style.dart';

import 'package:mtm/widgets/drawer.dart';
import 'package:mtm/widgets/navbar.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController? _empleadoController = TextEditingController();
  final TextEditingController? _rfcController = TextEditingController();
  final Connectivity connectivity = Connectivity();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MaterialColors.bgColorScreen,
        extendBodyBehindAppBar: true,
        body: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 30),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22.0, vertical: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [Image.asset('assets/logo.png')],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: TextField(
                        controller: _empleadoController,
                        style: TextStyle(color: colorStyle.secondaryColor),
                        decoration: InputDecoration(
                          labelText: "ID de Empleado",
                          labelStyle:
                              TextStyle(color: colorStyle.secondaryColor),
                          focusColor: colorStyle.secondaryColor,
                          border: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: colorStyle.secondaryColor)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 8),
                      child: Theme(
                        data: ThemeData(
                            primaryColor: colorStyle.secondaryColor,
                            accentColor: colorStyle.secondaryColor,
                            hintColor: MaterialColors.muted),
                        child: TextField(
                          style: TextStyle(color: colorStyle.secondaryColor),
                          obscureText: false,
                          controller: _rfcController,
                          decoration: InputDecoration(
                              labelText: "RFC",
                              labelStyle:
                                  TextStyle(color: colorStyle.secondaryColor),
                              focusColor: colorStyle.secondaryColor,
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: colorStyle.secondaryColor))),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 48.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: RaisedButton(
                            elevation: 4.0,
                            onPressed: () async {
                              final connectivityStatus =
                                  await connectivity.checkConnectivity();

                              final authService = Provider.of<AuthService>(
                                  context,
                                  listen: false);
                              if (_formKey.currentState!.validate()) {
                                try {
                                  if (connectivityStatus !=
                                      ConnectivityResult.none) {
                                    print('connected');
                                    final String? resp =
                                        (await authService.login(
                                            _empleadoController!.text,
                                            _rfcController!.text));
                                    print(resp);
                                    if (resp == null) {
                                      Navigator.pushReplacementNamed(
                                          context, PageRoutes.home);
                                    } else {
                                      NotificationService.showSnackBarError(
                                          resp, context);
                                    }
                                  }
                                } on SocketException catch (_) {
                                  NotificationService.showSnackBarError(
                                      "No hay acceso a internet", context);
                                }
                              } else {
                                NotificationService.showSnackBarError(
                                    "Los campos son obligatorios", context);
                              }
                            },
                            textColor: Colors.white,
                            color: colorStyle.primaryColor,
                            padding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 16.0),
                            child: Text("INICIAR SESIÓN",
                                style: TextStyle(fontSize: 16))),
                      ),
                    ),

                    /* Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: FlatButton(
                          child: Text("¿No tienes una cuenta? Registrate"),
                          textColor: Colors.white.withOpacity(0.6),
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, PageRoutes.register);
                          }),
                    ) */
                  ],
                ),
              ),
            )));
  }
}
