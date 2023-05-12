import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:mtm/DB/database.dart';
import 'package:mtm/blocs/preferences_bloc.dart';
import 'package:mtm/generated/l10n.dart';
import 'package:mtm/repositories/preferences_repository_impl.dart';
import 'package:mtm/routes/routes.dart';
import 'package:mtm/services/radio_service.dart';
import 'package:mtm/services/load_data.dart';
import 'package:mtm/services/perfil_service.dart';
// screens

import 'package:mtm/services/auth_service.dart';
import 'package:mtm/services/push_notifications_service.dart';
import 'package:mtm/services/settings_service.dart';
import 'package:mtm/setting/firebase_config.dart';
import 'package:mtm/setting/style.dart';
import 'package:mtm/setting/themes.dart';
import 'package:mtm/share_prefs/prefs_usuario.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //se carga la clase con unica instancia de preferencias de usuario
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  await PushNotificationService.initializeApp(
      DefaultFirebaseConfig.platformOptions);

  //se cargan las preferencias de idioma
  final preferencesRepository = PreferencesRepositoryImpl();

  final preferencesBloc = PreferencesBloc(
    preferencesRepository: preferencesRepository,
    initialLocale: await preferencesRepository.locale,
  );
  //Cargar el archivo de configuraciones en assets/cfg
  await GlobalConfiguration().loadFromAsset("config_prod");

  //to prevent CERTIFICATE_VERIFY_FAILED
  HttpOverrides.global = MyHttpOverrides();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => preferencesBloc,
      )
    ],
    child: AppState(),
  ));
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => PushNotificationService()),
        ChangeNotifierProvider(create: (_) => LoadDataService()),
        ChangeNotifierProvider(create: (_) => PerfilService()),
        ChangeNotifierProvider(create: (_) => RadioService()),
        ChangeNotifierProvider(create: (_) => SettingService()),
      ],
      child: myApp(),
    );
  }
}

class myApp extends StatefulWidget {
  myApp({Key? key}) : super(key: key);

  _myAppState createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  /// Create _themeBloc for double theme (Dark and White theme)
  late ThemeBloc _themeBloc;
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messengerKey =
      new GlobalKey<ScaffoldMessengerState>();
  late final _connectivity;
  var databaseFuture = DatabaseHelper.db.database;
  PushNotificationService? notiService = PushNotificationService();

  @override
  void initState() {
    _themeBloc = ThemeBloc();

    _connectivity = Connectivity();

    final connectivityStatus = _connectivity.checkConnectivity();
    final authService = Provider.of<AuthService>(context, listen: false);
    authService.get_open_checkin();

    PushNotificationService.messagesStream.listen((message) {
      print("message.notification!.title");
      print(message.notification!.title);
      get_notis(message);

      final snackBar = SnackBar(
          backgroundColor: colorStyle.secondaryColor,
          elevation: 5.0,
          behavior: SnackBarBehavior.floating,
          action: SnackBarAction(
              label: "Ver",
              textColor: Colors.white,
              onPressed: () {
                navigatorKey.currentState!.pushNamed(PageRoutes.noti);
              }),
          content: Text(
              "Nueva notificación: " + message.notification!.title.toString()));
      messengerKey.currentState?.showSnackBar(snackBar);
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => verificar_reacion());
    super.initState();
  }

  verificar_reacion() {
    final authService = Provider.of<AuthService>(context, listen: false);

    if (authService.forzarCierreSessionGet) {
      authService.logout();
      Navigator.pushReplacementNamed(context, PageRoutes.login);
    }
  }

  Future get_notis(RemoteMessage message) async {
    final notiService =
        Provider.of<PushNotificationService>(context, listen: false);
    final Database database = await databaseFuture;
    const TABLE = "notificaciones";
    Batch batch = database.batch();
    batch.insert(TABLE, {
      'senderId': message.senderId.toString(),
      'category': message.category.toString(),
      'collapseKey': message.collapseKey.toString(),
      'contentAvailable': message.contentAvailable.toString(),
      'data': message.data.toString(),
      'fromD': message.from.toString(),
      'messageId': message.messageId.toString(),
      'messageType': message.messageType.toString(),
      'mutableContent': message.mutableContent.toString(),
      'title': message.notification?.title.toString() ?? "Sin titulo",
      'body': message.notification?.body.toString() ?? "Sin descripción",
      'sentTime': DateTime.now().toString(),
      'threadId': message.threadId.toString(),
      'ttl': message.ttl.toString(),
      'seen': "0"
    });
    batch.commit();
    notiService.get_local_notifications();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesBloc, PreferencesState>(
        builder: (context, state) {
      /// To set orientation always portrait
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

      /// StreamBuilder for themeBloc
      return StreamBuilder<ThemeData>(
        initialData: _themeBloc.initialTheme().data,
        stream: _themeBloc.themeDataStream,
        builder: (BuildContext context, AsyncSnapshot<ThemeData> snapshot) {
          return GetMaterialApp(
            title: 'Radio ICAR',
            theme: snapshot.data,
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            scaffoldMessengerKey: messengerKey,
            home: SplashScreen(
              themeBloc: _themeBloc,
            ),
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              S.delegate,
              LocaleNamesLocalizationsDelegate(),
            ],
            //obtiene los idiomas soportados
            supportedLocales: S.delegate.supportedLocales,
            //obtiene el idioma predeterminado
            locale: state.locale,

            /// Move splash screen to onBoarding Layout
            /// Routes
            ///
            routes: PageRoutes().routes(),
          );
        },
      );
    });
  }
}

/// Component UI
class SplashScreen extends StatefulWidget {
  ThemeBloc themeBloc;
  SplashScreen({required this.themeBloc});
  @override
  _SplashScreenState createState() => _SplashScreenState(themeBloc);
}

/// Component UI
class _SplashScreenState extends State<SplashScreen> {
  ThemeBloc themeBloc;
  _SplashScreenState(this.themeBloc);
  final Connectivity connectivity = Connectivity();

  @override

  /// Setting duration in splash screen
  startTime() async {
    return new Timer(Duration(milliseconds: 2500), NavigatorPage);
  }

  /// To navigate layout change
  Future<void> NavigatorPage() async {
    //Navigator.of(context).pushReplacementNamed("onBoarding");
    final storage = new FlutterSecureStorage();
    final prefs = new PreferenciasUsuario();
    final connectivityStatus = await connectivity.checkConnectivity();

    /* if (connectivityStatus != ConnectivityResult.none) {
      String _token = (await storage.read(key: "tokenAuth")) ?? '';
      if (prefs.fl_usuario != "" && _token != "") {
        Navigator.pushReplacementNamed(context, PageRoutes.home);
      } else {
        Navigator.pushReplacementNamed(context, PageRoutes.login);
      }
    } else {
      Navigator.pushReplacementNamed(context, PageRoutes.no_connect);
    } */
    Navigator.pushReplacementNamed(context, PageRoutes.home);
  }

  /// Declare startTime to InitState
  @override
  void initState() {
    super.initState();
    startTime();
  }

  /// Code Create UI Splash Screen
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      body: Container(
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset("assets/logo.png", height: 150.0),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
