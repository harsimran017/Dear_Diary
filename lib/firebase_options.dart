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
    apiKey: 'AIzaSyDfT_Jf4YuGXZ6zC2DB1esge0ECKE4_gC4',
    appId: '1:368154891464:web:d2c69dad965ad9c7d741fd',
    messagingSenderId: '368154891464',
    projectId: 'test1-4bc60',
    authDomain: 'test1-4bc60.firebaseapp.com',
    storageBucket: 'test1-4bc60.appspot.com',
    measurementId: 'G-2BM13G6ETS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAHai0JCrixMJWZAe530Jm5K11rn4W8C5Y',
    appId: '1:368154891464:android:8ad291e8b719aa21d741fd',
    messagingSenderId: '368154891464',
    projectId: 'test1-4bc60',
    storageBucket: 'test1-4bc60.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCZkMhJyEXrxxnnqLj-rA5--ECIGl3m1gg',
    appId: '1:368154891464:ios:12264cee50a1f3a6d741fd',
    messagingSenderId: '368154891464',
    projectId: 'test1-4bc60',
    storageBucket: 'test1-4bc60.appspot.com',
    iosClientId: '368154891464-t430o1s4kkmu60tt92jkls0lq9kma4u1.apps.googleusercontent.com',
    iosBundleId: 'com.example.untitled',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCZkMhJyEXrxxnnqLj-rA5--ECIGl3m1gg',
    appId: '1:368154891464:ios:cdc80c1ed2be28f9d741fd',
    messagingSenderId: '368154891464',
    projectId: 'test1-4bc60',
    storageBucket: 'test1-4bc60.appspot.com',
    iosClientId: '368154891464-huqae5rckaf32ar96kpa8951qi0a6m8b.apps.googleusercontent.com',
    iosBundleId: 'com.example.untitled.RunnerTests',
  );
}
