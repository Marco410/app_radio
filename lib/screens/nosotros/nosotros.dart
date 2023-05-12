import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mtm/routes/routes.dart';
import 'package:mtm/services/notification_service.dart';
import 'package:mtm/setting/style.dart';
import 'package:provider/provider.dart';

import '../../constants/Theme.dart';
import '../../widgets/drawer.dart';
import '../../widgets/navbar.dart';
import '../navegacion.dart';

class Nosotros extends StatefulWidget {
  const Nosotros();

  @override
  State<Nosotros> createState() => _VotacionesState();
}

class _VotacionesState extends State<Nosotros> {
  final TextEditingController? _searchController = TextEditingController();

  bool loading = true;

  void initState() {
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        loading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new NavegacionModel(),
      child: Scaffold(
          appBar: Navbar(
            title: "Nosotros",
            backButton: true,
            transparent: true,
          ),
          backgroundColor: MaterialColors.bgColorScreen,
          // key: _scaffoldKey,
          body: (loading)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  padding: EdgeInsets.only(top: 15, left: 10, right: 10),
                  margin:
                      EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("¿Quiénes somos?",
                            style: TextStyle(
                                fontSize: 20,
                                color: colorStyle.secondaryColor,
                                fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Aliento Radio, es una cadena radial hispana ubicada en Houston - Texas. Desde mayo del 2013, hemos trasmitido de manera continua nuestra programación, la cual está dirigida a la comunidad Cristiano - Latina.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "En Houston contamos con las frecuencias 101.7 FM y 1450 AM, además, trasmitimos nuestra programacion a través del sitio www.alientoradio.com y nuestra apliación móvil aliento radio.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Misión",
                            style: TextStyle(
                                fontSize: 20,
                                color: colorStyle.secondaryColor,
                                fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            "Estamos llamados a compartir el mensaje de salvación, por eso hacemos Radio de calidad con contenidos y programas que lleven Aliento y Edifiquen la vida de nuestros oyentes.",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black54)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Visión",
                            style: TextStyle(
                                fontSize: 20,
                                color: colorStyle.secondaryColor,
                                fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            "Creemos que una palabra de Aliento, puede cambiar vidas, por eso queremos hacer, que nuestra radio llegue a todos los rincones del mundo.",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black54)),
                      )
                    ],
                  ),
                )),
    );
  }
}
