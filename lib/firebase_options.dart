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
    apiKey: 'AIzaSyBhSslVzeTQWb76pXLQkoahwYeF7Rgaqj4',
    appId: '1:411540933682:web:e46559b1324c6a1118002b',
    messagingSenderId: '411540933682',
    projectId: 'sealabus-9f7a8',
    authDomain: 'sealabus-9f7a8.firebaseapp.com',
    storageBucket: 'sealabus-9f7a8.appspot.com',
    measurementId: 'G-BMG7GDSD3T',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCEFkCWuH0mBXTnWtlSlTRjdYxsTF1mjtM',
    appId: '1:411540933682:android:7cc3688658aa284818002b',
    messagingSenderId: '411540933682',
    projectId: 'sealabus-9f7a8',
    storageBucket: 'sealabus-9f7a8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAU3J82gsx9VS1od4_nTVGeeItK7l1LyU4',
    appId: '1:411540933682:ios:9b74071c59e6540218002b',
    messagingSenderId: '411540933682',
    projectId: 'sealabus-9f7a8',
    storageBucket: 'sealabus-9f7a8.appspot.com',
    iosBundleId: 'com.example.mataKuliah',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAU3J82gsx9VS1od4_nTVGeeItK7l1LyU4',
    appId: '1:411540933682:ios:886e3f7d06e3151f18002b',
    messagingSenderId: '411540933682',
    projectId: 'sealabus-9f7a8',
    storageBucket: 'sealabus-9f7a8.appspot.com',
    iosBundleId: 'com.example.mataKuliah.RunnerTests',
  );
}