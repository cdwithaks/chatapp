// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCYtkYr2wzsiqlkULC0SvJxCsOx-Y_G5DI',
    appId: '1:282366167224:web:2d4385b010dcc30dbf8c4d',
    messagingSenderId: '282366167224',
    projectId: 'chatapp-test-8434c',
    authDomain: 'chatapp-test-8434c.firebaseapp.com',
    storageBucket: 'chatapp-test-8434c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAGx1xzudIAR1RgsuIHXm58_0TudTM95KM',
    appId: '1:282366167224:android:1dabf9d8f3dc75febf8c4d',
    messagingSenderId: '282366167224',
    projectId: 'chatapp-test-8434c',
    storageBucket: 'chatapp-test-8434c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBCmnhzT_TXyfU14-ce43Vhm2501HqA_2I',
    appId: '1:282366167224:ios:e7ade52b23d06b75bf8c4d',
    messagingSenderId: '282366167224',
    projectId: 'chatapp-test-8434c',
    storageBucket: 'chatapp-test-8434c.appspot.com',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBCmnhzT_TXyfU14-ce43Vhm2501HqA_2I',
    appId: '1:282366167224:ios:e7ade52b23d06b75bf8c4d',
    messagingSenderId: '282366167224',
    projectId: 'chatapp-test-8434c',
    storageBucket: 'chatapp-test-8434c.appspot.com',
    iosBundleId: 'com.example.chatapp',
  );
}