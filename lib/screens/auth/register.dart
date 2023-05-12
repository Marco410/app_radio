import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:mtm/constants/Theme.dart';
import 'package:mtm/routes/routes.dart';

import 'package:mtm/widgets/drawer.dart';
import 'package:mtm/widgets/navbar.dart';
import 'package:provider/provider.dart';

import '../../services/auth_service.dart';
import '../../services/notification_service.dart';

class RegisterPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController? _emailController = TextEditingController();
  final TextEditingController? _empresaController = TextEditingController();
  final TextEditingController? _passwordController = TextEditingController();
  final TextEditingController? _passwordConfirmController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: MaterialColors.bgColorScreen,
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              MaterialColors.signStartGradient,
              MaterialColors.signEndGradient
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: Container(
              margin: EdgeInsets.only(bottom: 20, top: 20),
              padding: EdgeInsets.only(left: 18.0, right: 18.0, top: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [Image.asset('assets/logo.png')],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Theme(
                        data: ThemeData(
                            primaryColor: Colors.white,
                            accentColor: Colors.white,
                            hintColor: MaterialColors.muted),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: Colors.white),
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: "Email",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                          ),
                          validator: (input) {
                            String pattern =
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                            RegExp regExp = new RegExp(pattern);
                            if (input!.isEmpty) {
                              return "Inserte un email";
                            } else {
                              return regExp.hasMatch(input)
                                  ? null
                                  : "Inserte un email valido";
                            }
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Theme(
                        data: ThemeData(
                            primaryColor: Colors.white,
                            accentColor: Colors.white,
                            hintColor: MaterialColors.muted),
                        child: TextFormField(
                          controller: _empresaController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: "¿De que empresa eres?",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Theme(
                        data: ThemeData(
                            primaryColor: Colors.white,
                            accentColor: Colors.white,
                            hintColor: MaterialColors.muted),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          obscureText: true,
                          controller: _passwordController,
                          decoration: InputDecoration(
                              labelText: "Contraseña",
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey))),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Theme(
                        data: ThemeData(
                            primaryColor: Colors.white,
                            accentColor: Colors.white,
                            hintColor: MaterialColors.muted),
                        child: TextFormField(
                          controller: _passwordConfirmController,
                          style: TextStyle(color: Colors.white),
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: "Confirma tu Contraseña",
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey))),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(top: 10),
                      child: RaisedButton(
                          elevation: 4.0,
                          onPressed: () async {
                            if (_formKey.currentState!.validate() &&
                                _emailController!.text != "" &&
                                _empresaController!.text != "" &&
                                _passwordController!.text != "") {
                              if (_passwordController!.text ==
                                  _passwordConfirmController!.text) {
                                if (_passwordController!.text.length > 7) {
                                  final authService = Provider.of<AuthService>(
                                      context,
                                      listen: false);
                                  final String? resp =
                                      (await authService.register(
                                          _emailController!.text,
                                          _empresaController!.text,
                                          _passwordController!.text));

                                  Navigator.pushReplacementNamed(
                                      context, PageRoutes.login);
                                  NotificationService.showSnackBarSuccess(
                                      "Registro éxitoso. Nos estaremos comunicando a " +
                                          _emailController!.text +
                                          " para validar tu usuario.",
                                      context);
                                } else {
                                  NotificationService.showSnackBarError(
                                      "Las contraseña debe de tener más de 8 caracteres.",
                                      context);
                                }
                              } else {
                                NotificationService.showSnackBarError(
                                    "Las contraseñas no coinciden.", context);
                              }
                            } else {
                              NotificationService.showSnackBarError(
                                  "Hay campos vacios en el formulario.",
                                  context);
                            }
                          },
                          textColor: Colors.white,
                          color: MaterialColors.primary,
                          padding: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 16.0),
                          child: Text("REGISTRARME",
                              style: TextStyle(fontSize: 16))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: FlatButton(
                          child: Text("¿Ya tienes una cuenta? Inicia Sesión"),
                          textColor: Colors.grey,
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, PageRoutes.login);
                          }),
                    )
                  ],
                ),
              ),
            )));
  }
}
