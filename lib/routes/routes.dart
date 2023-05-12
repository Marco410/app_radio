import 'package:flutter/material.dart';
import 'package:mtm/screens/auth/login.dart';
import 'package:mtm/screens/auth/no_connection.dart';
import 'package:mtm/screens/auth/register.dart';
import 'package:mtm/screens/home.dart';
import 'package:mtm/screens/notificaciones/noti.dart';
import 'package:mtm/screens/notificaciones/noti_preview.dart';
import 'package:mtm/screens/patrocinadores/patrocinadores.dart';

class PageRoutes {
  static const String login = 'login';
  static const String register = 'register';
  static const String home = 'home';
  static const String perfil = 'perfil';
  static const String no_connect = 'no_connect';
  static const String notifications = 'notifications';
  static const String noti = 'noti';
  static const String noti_preview = 'noti_preview';
  static const String patrocinadores = 'patrocinadores';

  Map<String, WidgetBuilder> routes() {
    return {
      login: (context) => LoginPage(),
      register: (context) => RegisterPage(),
      home: (context) => Home(),
      no_connect: (context) => NoConnection(),
      notifications: (context) => NoConnection(),
      noti: (context) => NotiPage(),
      noti_preview: (context) => NotiPreviewPage(),
      patrocinadores: (context) => Patrocinadores(),
    };
  }
}
