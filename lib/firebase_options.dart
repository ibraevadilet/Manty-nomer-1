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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAyGUXJKg8TLqGIvZ88QzA1OznlYE_NgXM',
    appId: '1:57140904659:web:dc550d8831eef0f81e4a26',
    messagingSenderId: '57140904659',
    projectId: 'manty-nomer-1-4d4c5',
    authDomain: 'manty-nomer-1-4d4c5.firebaseapp.com',
    storageBucket: 'manty-nomer-1-4d4c5.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBZbx-b1US7-whgJwUwHolkwLLdsnaHOzI',
    appId: '1:57140904659:android:3a179fa1588fc8ff1e4a26',
    messagingSenderId: '57140904659',
    projectId: 'manty-nomer-1-4d4c5',
    storageBucket: 'manty-nomer-1-4d4c5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCl7tD4c6s__9k67ZxKWtownQk9IGR8oSs',
    appId: '1:57140904659:ios:459ecaf6dfa2b2681e4a26',
    messagingSenderId: '57140904659',
    projectId: 'manty-nomer-1-4d4c5',
    storageBucket: 'manty-nomer-1-4d4c5.appspot.com',
    iosClientId:
        '57140904659-vc2rv3h5ub5vj6fkod9699fonqvlq93o.apps.googleusercontent.com',
    iosBundleId: 'com.example.mantyNomer1',
  );
}