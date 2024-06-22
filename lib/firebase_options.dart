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
    apiKey: 'AIzaSyA4V6HtsALgC53FEF-0EGQqNeFjrWDGWIw',
    appId: '1:1050456104948:web:ffd414197fc2d918dee3a1',
    messagingSenderId: '1050456104948',
    projectId: 'tuaibaptechproject',
    authDomain: 'tuaibaptechproject.firebaseapp.com',
    storageBucket: 'tuaibaptechproject.appspot.com',
    measurementId: 'G-ESX7GYBDB8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAkn4BWjo4iNyaOhi17BBx00WUWubRCUf4',
    appId: '1:1050456104948:android:42e65ea032624b43dee3a1',
    messagingSenderId: '1050456104948',
    projectId: 'tuaibaptechproject',
    storageBucket: 'tuaibaptechproject.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAGx38t_9COUQxsJMrtbGYLnrCKRjrx-wU',
    appId: '1:1050456104948:ios:dcdb1ee44ae10bf8dee3a1',
    messagingSenderId: '1050456104948',
    projectId: 'tuaibaptechproject',
    storageBucket: 'tuaibaptechproject.appspot.com',
    iosBundleId: 'com.example.tuaibkhan2ndproject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAGx38t_9COUQxsJMrtbGYLnrCKRjrx-wU',
    appId: '1:1050456104948:ios:dcdb1ee44ae10bf8dee3a1',
    messagingSenderId: '1050456104948',
    projectId: 'tuaibaptechproject',
    storageBucket: 'tuaibaptechproject.appspot.com',
    iosBundleId: 'com.example.tuaibkhan2ndproject',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA4V6HtsALgC53FEF-0EGQqNeFjrWDGWIw',
    appId: '1:1050456104948:web:0e854ffeedd97408dee3a1',
    messagingSenderId: '1050456104948',
    projectId: 'tuaibaptechproject',
    authDomain: 'tuaibaptechproject.firebaseapp.com',
    storageBucket: 'tuaibaptechproject.appspot.com',
    measurementId: 'G-1YY20CE5ED',
  );
}
