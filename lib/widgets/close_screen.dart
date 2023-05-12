import 'package:flutter/material.dart';
import 'package:mtm/services/notification_service.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:mtm/setting/style.dart';

import '../services/radio_service.dart';

class CloseScreen extends StatelessWidget {
  const CloseScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title + " esta cerrado",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.red[300],
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Da clic en el botón 'Actualizar' cuando te indiquen que es tiempo de " +
                      title +
                      ".",
                  textAlign: TextAlign.center,
                ),
              ],
            )),
        Expanded(
          flex: 10,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Lottie.network(
                "https://assets8.lottiefiles.com/packages/lf20_gc3pn97g.json",
                fit: BoxFit.cover),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: 45,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Actualizar',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                primary: colorStyle.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // <-- Radius
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
