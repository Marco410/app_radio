import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mtm/generated/intl/messages_es.dart';
import 'package:mtm/screens/navegacion.dart';
import 'package:mtm/services/notification_service.dart';
import 'package:mtm/setting/style.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../DB/database.dart';
import '../../constants/Theme.dart';
import '../../routes/routes.dart';
import '../../services/push_notifications_service.dart';
import '../../widgets/navbar.dart';

class NotiPreviewPage extends StatefulWidget {
  const NotiPreviewPage();

  @override
  State<NotiPreviewPage> createState() => _NotiPreviewPageState();
}

class _NotiPreviewPageState extends State<NotiPreviewPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final notiSelected =
        Provider.of<PushNotificationService>(context).notiSelectedGet;
    return Scaffold(
      appBar: Navbar(
        title: "Notificación",
        backButton: true,
        transparent: true,
        rightOptions: false,
      ),
      backgroundColor: MaterialColors.bgColorScreen,
      body: (notiSelected.length == 0)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : FadedSlideAnimation(
              child: Container(
                padding: EdgeInsets.all(17),
                margin: EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Image.asset(
                          "assets/logo-icon.png",
                          scale: 2,
                        )),
                    /* Text(notiSelected.toString()), */
                    Text(
                      notiSelected[0]['title'].toString(),
                      style: TextStyle(
                          color: colorStyle.secondaryColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      notiSelected[0]['body'].toString(),
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: colorStyle.secondaryColor,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      DateFormat('d-M-y HH:mm').format(DateTime.parse(
                              notiSelected[0]['sentTime'].toString())) +
                          " Hrs",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 13, color: colorStyle.hintSecondColor),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    (notiSelected[0]['title'].toString() == "Ambiente")
                        ? Container(
                            height: 45,
                            padding: EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 10),
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'Ver Resultados',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: colorStyle.secondaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(8), // <-- Radius
                                ),
                              ),
                            ),
                          )
                        : SizedBox(),
                    InkWell(
                      onTap: () {
                        NotificationService.showSnackBarDeleteNoti(
                            "¿Estás seguro de eliminar esta notificación?",
                            notiSelected[0]['id'].toString(),
                            context);
                      },
                      child: Icon(
                        Icons.delete,
                        color: colorStyle.primaryColor,
                      ),
                    )
                  ],
                ),
              ),
              beginOffset: Offset(0, 0.3),
              endOffset: Offset(0, 0),
              slideCurve: Curves.linearToEaseOut,
            ),
    );
  }
}
