import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mtm/routes/routes.dart';
import 'package:mtm/services/notification_service.dart';
import 'package:mtm/setting/style.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../constants/Theme.dart';
import '../../widgets/drawer.dart';
import '../../widgets/navbar.dart';
import '../navegacion.dart';

class Patrocinadores extends StatefulWidget {
  const Patrocinadores();

  @override
  State<Patrocinadores> createState() => _VotacionesState();
}

class _VotacionesState extends State<Patrocinadores> {
  final TextEditingController? _searchController = TextEditingController();
  final GlobalKey _scaffoldKey = new GlobalKey();

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
          key: _scaffoldKey,
          appBar: Navbar(
            title: "Patrocinadores",
            keyScaffold: _scaffoldKey,
            backButton: true,
          ),
          backgroundColor: Colors.white,
          // key: _scaffoldKey,
          body: (loading)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  padding:
                      EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
                  margin:
                      EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 10),
                  decoration: BoxDecoration(
                      color: MaterialColors.bgColorScreen,
                      image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              Colors.black45, BlendMode.darken),
                          image: AssetImage("assets/img/back.jpg"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                            "TE INVITAMOS A CONOCER NUESTROS PATROCINADORES.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                color: colorStyle.whiteBacground,
                                fontWeight: FontWeight.bold)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () =>
                                launchUrlString("http://www.icarnorth.com/"),
                            child: Image.asset(
                              'assets/img/patrocinadores/13.png',
                              width: 100,
                            ),
                          ),
                          InkWell(
                            onTap: () => launchUrlString(
                                "http://www.amoryrestauracion.tv/"),
                            child: Image.asset(
                              'assets/img/patrocinadores/12.png',
                              width: 100,
                            ),
                          ),
                          InkWell(
                            onTap: () => launchUrlString(
                                "https://www.elvirmediaproducciones.com/?fbclid=IwAR1WcuTVI8qZtXxJ--_vRksYpIcf-LMmuwsNfAAktQkzG4A53d4tTHs6smo"),
                            child: Image.asset(
                              'assets/img/patrocinadores/2.png',
                              width: 100,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/img/patrocinadores/17.png',
                            width: 100,
                          ),
                          InkWell(
                            onTap: () => launchUrlString(
                                "https://garciahamiltonassociates.com/?fbclid=IwAR39zbyRBjAD4bnZk19yzp_hCKs79c8LPaJj-NPDo3eeFlelSCj8726LiXM"),
                            child: Image.asset(
                              'assets/img/patrocinadores/4.png',
                              width: 100,
                            ),
                          ),
                          InkWell(
                            onTap: () => launchUrlString(
                                "https://kreativehouston.com/?fbclid=IwAR3bBKp_Js99X9W-74WFlWTSCl_zEQi0DKnl8N7RlccMfb339AHikHPvnXI"),
                            child: Image.asset(
                              'assets/img/patrocinadores/5.png',
                              width: 100,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => launchUrlString(
                                "https://www.popularmotorshouston.com/?fbclid=IwAR1B6_twdY-yX3-OWPGcRQYEs7kRqeAT8EupKAvwEtO5powbRAJ5yIJWXIs"),
                            child: Image.asset(
                              'assets/img/patrocinadores/3.png',
                              width: 100,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
    );
  }
}
