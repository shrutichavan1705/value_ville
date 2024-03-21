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
    apiKey: 'AIzaSyD70eOg3I3rRhEKDhzDAzG4FL2otbR74sk',
    appId: '1:342571500267:web:c0f081a9da2298e843b4ae',
    messagingSenderId: '342571500267',
    projectId: 'value-ville-3b54b',
    authDomain: 'value-ville-3b54b.firebaseapp.com',
    databaseURL: 'https://value-ville-3b54b-default-rtdb.firebaseio.com',
    storageBucket: 'value-ville-3b54b.appspot.com',
    measurementId: 'G-CP65S9LWQJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB4_idrpFkGvy3Zye28xDbT37THxbAsmwM',
    appId: '1:342571500267:android:0bda1bfea0280ed143b4ae',
    messagingSenderId: '342571500267',
    projectId: 'value-ville-3b54b',
    databaseURL: 'https://value-ville-3b54b-default-rtdb.firebaseio.com',
    storageBucket: 'value-ville-3b54b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCu0g7npFdNIkyvnQqtcQD2mpiqe_iKWqk',
    appId: '1:342571500267:ios:c3e5b265cc197fbb43b4ae',
    messagingSenderId: '342571500267',
    projectId: 'value-ville-3b54b',
    databaseURL: 'https://value-ville-3b54b-default-rtdb.firebaseio.com',
    storageBucket: 'value-ville-3b54b.appspot.com',
    iosBundleId: 'com.example.valueVille',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCu0g7npFdNIkyvnQqtcQD2mpiqe_iKWqk',
    appId: '1:342571500267:ios:ff7914968a51168243b4ae',
    messagingSenderId: '342571500267',
    projectId: 'value-ville-3b54b',
    databaseURL: 'https://value-ville-3b54b-default-rtdb.firebaseio.com',
    storageBucket: 'value-ville-3b54b.appspot.com',
    iosBundleId: 'com.example.valueVille.RunnerTests',
  );
}
