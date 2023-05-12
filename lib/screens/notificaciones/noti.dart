import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mtm/generated/intl/messages_es.dart';
import 'package:mtm/routes/routes.dart';
import 'package:mtm/setting/style.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../DB/database.dart';
import '../../constants/Theme.dart';
import '../../services/push_notifications_service.dart';
import '../../widgets/navbar.dart';

class NotiPage extends StatefulWidget {
  const NotiPage();

  @override
  State<NotiPage> createState() => _NotiPageState();
}

class _NotiPageState extends State<NotiPage> {
  List<RemoteMessage> _messages = [];
  var databaseFuture = DatabaseHelper.db.database;
  PushNotificationService? notiService = PushNotificationService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final listNotis = Provider.of<PushNotificationService>(context).notisGet;
    return Scaffold(
      appBar: Navbar(
        title: "Notificaciones",
        backButton: true,
        transparent: true,
        rightOptions: false,
      ),
      backgroundColor: MaterialColors.bgColorScreen,
      body: FadedSlideAnimation(
        child: (listNotis.length == 0)
            ? Center(child: Text("Aún no hay notificaciones"))
            : Stack(
                children: [
                  ListView.builder(
                      itemCount: listNotis.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        Map<String, Object?> noti = listNotis[index];

                        return InkWell(
                          onTap: () {
                            final notiService =
                                Provider.of<PushNotificationService>(context,
                                    listen: false);
                            notiService.get_noti(noti['id'].toString());

                            Navigator.pushNamed(
                                context, PageRoutes.noti_preview);
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 25, right: 25, top: 12, bottom: 12),
                            margin: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                          margin: EdgeInsets.only(right: 20),
                                          padding: EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Image.asset(
                                            "assets/logo-icon.png",
                                            scale: 6,
                                          )),
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              width: 250,
                                              child: Text(
                                                noti['title'].toString(),
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 250,
                                              child: Text(
                                                noti['body'].toString(),
                                                textAlign: TextAlign.left,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 250,
                                              child: Text(
                                                DateFormat('d-M-y HH:mm')
                                                        .format(DateTime.parse(
                                                            noti['sentTime']
                                                                .toString())) +
                                                    " Hrs",
                                                textAlign: TextAlign.left,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color: colorStyle
                                                        .hintSecondColor),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    (noti['seen'].toString() != "0")
                                        ? Expanded(flex: 1, child: SizedBox())
                                        : Expanded(
                                            flex: 1,
                                            child: Icon(
                                              Icons.circle,
                                              size: 13,
                                              color: colorStyle.primaryColor,
                                            ),
                                          )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      })
                ],
              ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
