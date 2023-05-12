import 'package:flutter/material.dart';
import 'package:mtm/screens/galeria/galeria.dart';
import 'package:mtm/screens/home.dart';
import 'package:mtm/screens/nosotros/nosotros.dart';
import 'package:provider/provider.dart';

import '../services/settings_service.dart';
import 'package:mtm/setting/style.dart';

import '../share_prefs/prefs_usuario.dart';

class Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<NavegacionModel>(context);
    final prefs = new PreferenciasUsuario();

    final List<BottomNavigationBarItem> elementsMenu = [
      BottomNavigationBarItem(
        backgroundColor: Colors.white,
        icon: Icon(Icons.people_rounded),
        label: "Nosotros",
      ),
      BottomNavigationBarItem(
          backgroundColor: Colors.white,
          icon: Icon(Icons.home_rounded),
          label: "Inicio"),
      BottomNavigationBarItem(
        backgroundColor: Colors.white,
        icon: Icon(Icons.image_rounded),
        label: "Galería",
      ),
    ];

    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.0),
        topRight: Radius.circular(30.0),
      ),
      child: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: navegacionModel.paginaActual,
          onTap: (i) => navegacionModel.paginaActual = i,
          unselectedFontSize: 10,
          unselectedItemColor: colorStyle.secondaryColor,
          unselectedLabelStyle:
              TextStyle(color: colorStyle.secondaryColor, fontSize: 10),
          unselectedIconTheme:
              IconThemeData(color: colorStyle.secondaryColor, size: 25),
          selectedLabelStyle: TextStyle(color: colorStyle.primaryColor),
          selectedItemColor: colorStyle.primaryColor,
          elevation: 15,
          selectedIconTheme: IconThemeData(
            size: 30,
          ),
          items: elementsMenu),
    );
  }
}

class Paginas extends StatelessWidget {
  final prefs = new PreferenciasUsuario();
  final dateNow = DateTime.now();

  Paginas({required Map<String, dynamic> argum});

  late Map<String, dynamic> argum = {};

  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<NavegacionModel>(context);

    WidgetsBinding.instance
        .addPostFrameCallback((_) => changePageNoti(context));

    final List<Widget> elementsMenu = [
      Nosotros(),
      HomePage(prefs: prefs, dateNow: dateNow),
      Galeria(),
    ];

    return PageView(
      // physics: BouncingScrollPhysics(),
      controller: navegacionModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: elementsMenu,
    );
  }

  changePageNoti(BuildContext context) {
    /*  final notiService =
        Provider.of<PushNotificationService>(context, listen: false); */
    final navegacionModel =
        Provider.of<NavegacionModel>(context, listen: false);
    final setService = Provider.of<SettingService>(context, listen: false);

    //TODO: this process never ends when i print something
    /*  if (notiService.argsGet != {}) {
      if (notiService.argsGet['type'] == 'home') {
        print("entra al cambio de página");
        navegacionModel.paginaActual = 0;
      } else if (notiService.argsGet['type'] == 'kit-resirene') {
        print("entra al cambio de página");
        navegacionModel.paginaActual = 1;
      } else if (notiService.argsGet['type'] == 'animo') {
        print("entra al cambio de página");
        navegacionModel.paginaActual = 2;
      } else if (notiService.argsGet['type'] == 'votacion') {
        print("entra al cambio de página");
        navegacionModel.paginaActual = 3;
      } else if (notiService.argsGet['type'] == 'galeria') {
        print("entra al cambio de página");
        navegacionModel.paginaActual = 4;
      } else if (notiService.argsGet['type'] == 'canciones') {
        print("entra al cambio de página");
        navegacionModel.paginaActual = 5;
      }
      notiService.argsSet = {};
    } */

    switch (navegacionModel._paginaActual) {
      case 0:
        setService.titleSet = "Nosotros";
        break;
      case 1:
        setService.titleSet = "Inicio"; // Kit Resirene
        break;
      case 2:
        setService.titleSet = "Galería";
        break;
      default:
        setService.titleSet = "Inicio";
        break;
    }
  }
}

class NavegacionModel with ChangeNotifier {
  int _paginaActual = 1;
  PageController _pageController = new PageController(initialPage: 1);

  int get paginaActual => this._paginaActual;

  set paginaActual(int valor) {
    this._paginaActual = valor;
    if (_pageController.hasClients) {
      _pageController.animateToPage(valor,
          duration: Duration(microseconds: 500), curve: Curves.bounceIn);
    }

    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
