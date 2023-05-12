import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:lottie/lottie.dart';

import 'package:mtm/constants/Theme.dart';
import 'package:mtm/services/settings_service.dart';
import 'package:mtm/setting/style.dart';
import 'package:mtm/share_prefs/prefs_usuario.dart';

//widgets
import 'package:mtm/widgets/navbar.dart';
import 'package:mtm/widgets/drawer.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../services/radio_service.dart';
import 'navegacion.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final GlobalKey _scaffoldKey = new GlobalKey();
  Map<String, dynamic> arguments = {};
  @override
  Widget build(BuildContext context) {
    final setService = Provider.of<SettingService>(context);
    final prefs = new PreferenciasUsuario();

    return ChangeNotifierProvider(
        create: (_) => new NavegacionModel(),
        child: Scaffold(
          key: _scaffoldKey,
          drawer: MaterialDrawer(
            currentPage: 'Inicio',
          ),
          appBar: Navbar(
              title: setService.titleGet,
              keyScaffold: _scaffoldKey,
              searchBar: true,
              isOnSearch: false,
              transparent: true),
          backgroundColor: MaterialColors.bgColorScreen,
          bottomNavigationBar: Navegacion(),
          // key: _scaffoldKey,
          body: Paginas(
            argum: arguments,
          ),
          extendBodyBehindAppBar: true,
        ));
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.prefs,
    required this.dateNow,
  }) : super(key: key);

  final PreferenciasUsuario prefs;
  final DateTime dateNow;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VideoPlayerController _controller;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  void initState() {
    final radioService = Provider.of<RadioService>(context, listen: false);
    _controller = VideoPlayerController.asset(
      'assets/video/aliento.mp4',
    )
      ..setLooping(true)
      ..initialize().then((_) {
        setState(() {});
        _controller.setVolume(0);
        _controller.play();
      });

    radioService.audioPlayerGet.onPlayerStateChanged.listen((event) {
      print("ASDDSDASDSADA");
      setState(() {
        radioService.isPlayingSet = event == PlayerState.PLAYING;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuario();
    final radioService = Provider.of<RadioService>(context);

    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      blurRadius: 20,
                      spreadRadius: 2.5,
                      offset: Offset(0, -1))
                ],
              ),
              child: _controller.value.isInitialized
                  ? ClipRRect(
                      child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                              Colors.black26, BlendMode.darken),
                          child: VideoPlayer(_controller)),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)))
                  : Container(),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    FadedScaleAnimation(
                      child: FractionalTranslation(
                        translation: Offset(-0.53, -1.00),
                        child: Text(
                          "Amor &",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 45,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    FadedScaleAnimation(
                      child: FractionalTranslation(
                        translation: Offset(-0.089, -1.00),
                        child: Text(
                          "Restauración",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: colorStyle.secondaryColor,
                              fontSize: 45,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    FadedScaleAnimation(
                      child: FractionalTranslation(
                          translation: Offset(-0.34, -1.60),
                          child: Text(
                            "Aliento 101.7 FM",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: colorStyle.secondaryColor,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    FadedScaleAnimation(
                      child: FractionalTranslation(
                        translation: Offset(-0.28, -0.90),
                        child: Text("Una palabra de ALIENTO",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    FadedScaleAnimation(
                      child: FractionalTranslation(
                        translation: Offset(-0.33, -0.80),
                        child: Text("puede cambiar tu vida.",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          (radioService.isPlayingGet)
              ? Expanded(
                  flex: 1,
                  child: FadedScaleAnimation(
                    child: Lottie.network(
                        "https://assets7.lottiefiles.com/packages/lf20_eN8m772nQj.json",
                        fit: BoxFit.cover),
                  ))
              : Expanded(flex: 1, child: SizedBox()),
          Expanded(
              flex: 5,
              child: Container(
                padding: EdgeInsets.all(40),
                child: SizedBox(
                  height: 100,
                  child: Container(
                      padding: EdgeInsets.all(35),
                      decoration: BoxDecoration(
                          color: colorStyle.secondaryColor,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 20,
                                spreadRadius: 5,
                                offset: Offset(0, 0))
                          ],
                          borderRadius: BorderRadius.circular(100)),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () async {
                              print("asd");
                              print(radioService.isPlayingGet);
                              if (radioService.isPlayingGet) {
                                await radioService.audioPlayerGet.stop();
                              } else {
                                final url =
                                    "https://air.doscast.com/proxy/alientofm/stream";
                                await radioService.audioPlayerGet.play(url);
                              }
                            },
                            child: Icon(
                              radioService.isPlayingGet
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              size: 90,
                              color: colorStyle.whiteBacground,
                            ),
                          )
                        ],
                      )),
                ),
              ))
        ],
      ),
    );
  }
}
