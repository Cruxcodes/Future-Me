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
        return windows;
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
    apiKey: 'AIzaSyB5k5nj88kgYeLRArEdypY3M7VJ-NjF2IA',
    appId: '1:970201980726:web:795afe4cbec91bc15a9d97',
    messagingSenderId: '970201980726',
    projectId: 'future-me-b9cec',
    authDomain: 'future-me-b9cec.firebaseapp.com',
    storageBucket: 'future-me-b9cec.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDmgxafSS93AThtwRlQ0q-L6v_KcE4eyCY',
    appId: '1:970201980726:android:8b931c27b02d09375a9d97',
    messagingSenderId: '970201980726',
    projectId: 'future-me-b9cec',
    storageBucket: 'future-me-b9cec.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC_bVZhoeAhw9SvFj06y96nND1dwvqMbEU',
    appId: '1:970201980726:ios:fa78ea1b914896c45a9d97',
    messagingSenderId: '970201980726',
    projectId: 'future-me-b9cec',
    storageBucket: 'future-me-b9cec.firebasestorage.app',
    iosBundleId: 'com.example.futureMe',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC_bVZhoeAhw9SvFj06y96nND1dwvqMbEU',
    appId: '1:970201980726:ios:fa78ea1b914896c45a9d97',
    messagingSenderId: '970201980726',
    projectId: 'future-me-b9cec',
    storageBucket: 'future-me-b9cec.firebasestorage.app',
    iosBundleId: 'com.example.futureMe',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB5k5nj88kgYeLRArEdypY3M7VJ-NjF2IA',
    appId: '1:970201980726:web:afdf1ba47ce680c25a9d97',
    messagingSenderId: '970201980726',
    projectId: 'future-me-b9cec',
    authDomain: 'future-me-b9cec.firebaseapp.com',
    storageBucket: 'future-me-b9cec.firebasestorage.app',
  );
}
