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
    apiKey: 'AIzaSyCOrml32XWqRXeSWuPOg5r5a2dky598vCw',
    appId: '1:500770003659:web:cac009df9de1fa3435d94e',
    messagingSenderId: '500770003659',
    projectId: 'fashion-flare-56391',
    authDomain: 'fashion-flare-56391.firebaseapp.com',
    storageBucket: 'fashion-flare-56391.appspot.com',
    measurementId: 'G-QLHSSMN7VF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBl-tMnsT-hXqHvGH-3T1BSSgckeg2_Vxg',
    appId: '1:500770003659:android:f4249a7f746e0dec35d94e',
    messagingSenderId: '500770003659',
    projectId: 'fashion-flare-56391',
    storageBucket: 'fashion-flare-56391.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBogKgvaT-LiGJAXFWLt1mVjgSbdDSVK6c',
    appId: '1:500770003659:ios:b8c5205b48518bc735d94e',
    messagingSenderId: '500770003659',
    projectId: 'fashion-flare-56391',
    storageBucket: 'fashion-flare-56391.appspot.com',
    androidClientId: '500770003659-v8gjaqh1nla781551j0oj15c093ifi2p.apps.googleusercontent.com',
    iosClientId: '500770003659-h11cnkjc8e7oe130vumc9bijatmid2ip.apps.googleusercontent.com',
    iosBundleId: 'com.example.fashionFlare',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBogKgvaT-LiGJAXFWLt1mVjgSbdDSVK6c',
    appId: '1:500770003659:ios:6a109092a3fe20cc35d94e',
    messagingSenderId: '500770003659',
    projectId: 'fashion-flare-56391',
    storageBucket: 'fashion-flare-56391.appspot.com',
    iosBundleId: 'com.example.fashionFlare.RunnerTests',
  );
}