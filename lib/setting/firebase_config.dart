import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    if (kIsWeb) {
      // Web
      return const FirebaseOptions(
        appId: '1:448618578101:web:0b650370bb29e29cac3efc',
        apiKey: 'AIzaSyAD_4IP5UN2CD59cQCxKyqAf1m9uyfEWF8',
        projectId: 'resirene-notifications',
        messagingSenderId: '733411717387',
      );
    } else if (Platform.isIOS || Platform.isMacOS) {
      // iOS and MacOS
      return const FirebaseOptions(
        appId: '1:385232993598:ios:b2f0d52742a4d490dd806f',
        apiKey: 'AIzaSyAxai7WPJvcFD4wOgtfbhFaY-4ShuPueEE',
        projectId: 'mtm-icar',
        messagingSenderId: '385232993598',
        iosBundleId: 'com.mtm.icarradio',
        authDomain: 'mtm-icar.firebaseapp.com',
      );
    } else {
      // Android
      return const FirebaseOptions(
        appId: '1:385232993598:android:39b4b650295c7086dd806f',
        apiKey: 'AIzaSyDiA87DxfaeZ0WJWtz0zuLDfQyeoN1N_qk',
        projectId: 'mtm-icar',
        messagingSenderId: '385232993598',
        authDomain: 'mtm-icar.firebaseapp.com',
      );
    }
  }
}
