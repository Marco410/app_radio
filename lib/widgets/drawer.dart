import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

import 'package:mtm/constants/Theme.dart';
import 'package:mtm/routes/routes.dart';
import 'package:mtm/services/auth_service.dart';
import 'package:mtm/services/notification_service.dart';
import 'package:mtm/share_prefs/prefs_usuario.dart';

import 'package:mtm/widgets/drawer-tile.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../services/perfil_service.dart';
import '../services/radio_service.dart';

class MaterialDrawer extends StatelessWidget {
  final String currentPage;

  MaterialDrawer({required this.currentPage});

  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuario();

    return Drawer(
      backgroundColor: Colors.transparent,
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          child: Column(children: [
            DrawerHeader(
                curve: Curves.bounceInOut,
                decoration: BoxDecoration(
                    color: MaterialColors.drawerHeader,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25))),
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 28.0),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                          child: Image.asset(
                            "assets/logo.png",
                            width: 150,
                          ),
                        ),
                      ],
                    ))),
            Expanded(
                child: ListView(
              padding: EdgeInsets.only(top: 8, left: 8, right: 8),
              children: [
                DrawerTile(
                    icon: Icons.home,
                    onTap: () {
                      Navigator.pushReplacementNamed(context, PageRoutes.home);
                    },
                    iconColor: Colors.black,
                    title: "Inicio",
                    isSelected: currentPage == "Inicio" ? true : false),
                DrawerTile(
                    icon: Icons.store_rounded,
                    onTap: () {
                      Navigator.pushNamed(context, PageRoutes.patrocinadores);
                    },
                    iconColor: Colors.black,
                    title: "Patrocinadores",
                    isSelected: currentPage == "Patrocinadores" ? true : false),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () => launchUrlString(
                            "https://www.facebook.com/alientoradiofmam"),
                        child: Image.asset(
                          'assets/icons/facebook.png',
                          width: 30,
                        ),
                      ),
                      InkWell(
                        onTap: () => launchUrlString(
                            "https://www.instagram.com/alientoradio/"),
                        child: Image.asset(
                          'assets/icons/instagram.png',
                          width: 30,
                        ),
                      ),
                      InkWell(
                        onTap: () => launchUrlString(
                            "https://www.tiktok.com/@alientoradio"),
                        child: Image.asset(
                          'assets/icons/tik-tok.png',
                          width: 30,
                        ),
                      ),
                      InkWell(
                        onTap: () => launchUrlString("https://wa.link/tbyc9a"),
                        child: Image.asset(
                          'assets/icons/whatsapp.png',
                          width: 30,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ))
          ])),
    );
  }
}
