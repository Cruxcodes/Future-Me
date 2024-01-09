// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyAFQ7roEBPkguRH85eDedCf-YEBS2SUV00',
    appId: '1:566352653292:web:4bc506eff48991f7516ec9',
    messagingSenderId: '566352653292',
    projectId: 'future-me-17cdf',
    authDomain: 'future-me-17cdf.firebaseapp.com',
    storageBucket: 'future-me-17cdf.appspot.com',
    measurementId: 'G-Q8D0EE0VLL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD4rOr6TbqPgTOXxPa0jI5UaQsX27GlNXE',
    appId: '1:566352653292:android:c401e791b9d8c872516ec9',
    messagingSenderId: '566352653292',
    projectId: 'future-me-17cdf',
    storageBucket: 'future-me-17cdf.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBIwky9EdEKJGRACMDg4Aqh5BJ4Io9HcKk',
    appId: '1:566352653292:ios:d2fdd0ddf7414e63516ec9',
    messagingSenderId: '566352653292',
    projectId: 'future-me-17cdf',
    storageBucket: 'future-me-17cdf.appspot.com',
    iosBundleId: 'com.example.futureMe',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBIwky9EdEKJGRACMDg4Aqh5BJ4Io9HcKk',
    appId: '1:566352653292:ios:e4e51dd15b64185f516ec9',
    messagingSenderId: '566352653292',
    projectId: 'future-me-17cdf',
    storageBucket: 'future-me-17cdf.appspot.com',
    iosBundleId: 'com.example.futureMe.RunnerTests',
  );
}
