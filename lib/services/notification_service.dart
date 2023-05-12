import 'package:flutter/material.dart';
import 'package:mtm/services/auth_service.dart';
import 'package:mtm/services/push_notifications_service.dart';
import 'package:mtm/setting/style.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';

import '../routes/routes.dart';

/* import 'package:hedggie/component/style.dart';
import 'package:hedggie/generated/l10n.dart'; */

class NotificationService {
  static GlobalKey<ScaffoldMessengerState> messengerkey =
      new GlobalKey<ScaffoldMessengerState>();

  static showSnackBarError(String message, BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          Future.delayed(Duration(seconds: 3), () {
            Navigator.of(context).pop(true);
          });
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              title: Text(
                "Error",
                style: TextStyle(color: Colors.white),
              ),
              content: Text(message,
                  style: TextStyle(color: Colors.white, fontSize: 19)),
              backgroundColor: Colors.red);
        },
        barrierDismissible: true);
  }

  static showSnackBarConnectionError(String message, BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              title: Column(
                children: [
                  Icon(
                    Icons.wifi_off,
                    color: Colors.white,
                    size: 80,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Error de Conexión",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              content: Text(message,
                  style: TextStyle(color: Colors.white, fontSize: 19)),
              backgroundColor: Colors.grey);
        },
        barrierDismissible: true);
  }

  static showSnackBarSuccess(String message, BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          Future.delayed(Duration(seconds: 3), () {
            Navigator.of(context).pop(true);
          });
          return Stack(
            children: [
              AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                title: Text(
                  "Éxito",
                  style: TextStyle(color: Colors.white),
                ),
                content: Text(message,
                    style: TextStyle(color: Colors.white, fontSize: 19)),
                backgroundColor: Colors.green,
              ),
              FractionalTranslation(
                translation: Offset(-0.00, -0.00),
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Lottie.network(
                        "https://assets3.lottiefiles.com/packages/lf20_lk80fpsm.json",
                        height: 150)),
              ),
            ],
          );
        },
        barrierDismissible: true);
  }

  static showSnackBarAlert(String message, BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          Future.delayed(Duration(seconds: 3), () {
            Navigator.of(context).pop(true);
          });
          return Stack(
            children: [
              AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  title: Text(
                    "Alerta",
                    style: TextStyle(color: Colors.white),
                  ),
                  content: Text(message,
                      style: TextStyle(color: Colors.white, fontSize: 19)),
                  backgroundColor: Colors.amber),
              FractionalTranslation(
                translation: Offset(-0.00, -0.00),
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Lottie.network(
                        "https://assets2.lottiefiles.com/packages/lf20_in9x61gh.json",
                        height: 150)),
              ),
            ],
          );
        },
        barrierDismissible: true);
  }

  static showSnackBarInfo(String message, BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Stack(
            children: [
              AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  title: Text(
                    "Info",
                    style: TextStyle(color: Colors.white),
                  ),
                  content: Text(message,
                      style: TextStyle(color: Colors.white, fontSize: 19)),
                  backgroundColor: Colors.blue),
              FractionalTranslation(
                translation: Offset(-0.00, -0.00),
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Lottie.network(
                        "https://assets5.lottiefiles.com/packages/lf20_FyZ3MPhoNm.json",
                        height: 150)),
              ),
            ],
          );
        },
        barrierDismissible: true);
  }

  static showSnackBarAlertVotoSave(
      String message, BuildContext context, bool fromSeach) {
    showDialog(
        context: context,
        builder: (context) {
          return Stack(
            children: [
              AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  title: Text(
                    "Ser Resirene",
                    style: TextStyle(color: Colors.blue),
                  ),
                  actions: <Widget>[
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(color: Colors.white),
                      ),
                      child: const Text(
                        'Cancelar',
                        style: TextStyle(color: Colors.black38),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(color: colorStyle.primaryColor),
                      ),
                      child: const Text('Confirmar voto'),
                      onPressed: () async {},
                    ),
                  ],
                  content: Text("Tu voto será para: \n" + message,
                      style: TextStyle(color: Colors.black54, fontSize: 19)),
                  backgroundColor: Colors.white),
            ],
          );
        },
        barrierDismissible: true);
  }

  static showSnackBarCerrarSesion(String message, BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Stack(
            children: [
              AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  title: Text(
                    "Cerrar Sesión",
                    style: TextStyle(color: Colors.blue),
                  ),
                  actions: <Widget>[
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(color: Colors.white),
                      ),
                      child: const Text(
                        'Cancelar',
                        style: TextStyle(color: Colors.black38),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(color: colorStyle.primaryColor),
                      ),
                      child: const Text('Sí, cerrar'),
                      onPressed: () async {
                        final authService =
                            Provider.of<AuthService>(context, listen: false);

                        authService.logout();
                        Navigator.pop(context);

                        Navigator.pushReplacementNamed(
                            context, PageRoutes.login);
                        showSnackBarSuccess("Cerraste sesión.", context);
                      },
                    ),
                  ],
                  content: Text(message,
                      style: TextStyle(color: Colors.black54, fontSize: 19)),
                  backgroundColor: Colors.white),
              FractionalTranslation(
                translation: Offset(-0.00, -0.00),
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Lottie.network(
                        "https://assets10.lottiefiles.com/packages/lf20_j5bdobha.json",
                        height: 250)),
              ),
            ],
          );
        },
        barrierDismissible: true);
  }

  static showSnackBarDeleteNoti(
      String message, String noti_id, BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Stack(
            children: [
              AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  title: Text(
                    "Eliminar",
                    style: TextStyle(color: Colors.blue),
                  ),
                  actions: <Widget>[
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(color: Colors.white),
                      ),
                      child: const Text(
                        'Cancelar',
                        style: TextStyle(color: Colors.black38),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(color: colorStyle.primaryColor),
                      ),
                      child: const Text('Sí'),
                      onPressed: () async {
                        final notiService =
                            Provider.of<PushNotificationService>(context,
                                listen: false);

                        notiService.delete_noti(noti_id);
                        Navigator.pop(context);
                        Navigator.pop(context);

                        showSnackBarSuccess("Notificación eliminada", context);
                      },
                    ),
                  ],
                  content: Text(message,
                      style: TextStyle(color: Colors.black54, fontSize: 19)),
                  backgroundColor: Colors.white),
            ],
          );
        },
        barrierDismissible: true);
  }
}
