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
    apiKey: 'AIzaSyCRD5eRIq4ERTIN8T7HdocpiVJIilrbUvE',
    appId: '1:633473080972:web:d3506d13638c9045b3e5a9',
    messagingSenderId: '633473080972',
    projectId: 'trip-planner-4ede0',
    authDomain: 'trip-planner-4ede0.firebaseapp.com',
    storageBucket: 'trip-planner-4ede0.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCRJGG7Jv5sO819433oBWU36FJpRxuC654',
    appId: '1:633473080972:android:3cdf4831dade66ecb3e5a9',
    messagingSenderId: '633473080972',
    projectId: 'trip-planner-4ede0',
    storageBucket: 'trip-planner-4ede0.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBQcSFMkpnCXBB3KfXq3ygTYDLHBRE5aWY',
    appId: '1:633473080972:ios:d59bfbf2a09ea3deb3e5a9',
    messagingSenderId: '633473080972',
    projectId: 'trip-planner-4ede0',
    storageBucket: 'trip-planner-4ede0.firebasestorage.app',
    iosClientId: '633473080972-a2qd9jfr8rbhq6fhmpueoqiu5oicm1s0.apps.googleusercontent.com',
    iosBundleId: 'com.example.tripPlanner',
  );
}
