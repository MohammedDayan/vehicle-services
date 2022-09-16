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
    apiKey: 'AIzaSyBo3WAA_2v-ykOEOjAKQ1Mig0BlH9pfYW4',
    appId: '1:1046317937993:web:a45b6adcad6c57722d1698',
    messagingSenderId: '1046317937993',
    projectId: 'vehicle-services-3c12b',
    authDomain: 'vehicle-services-3c12b.firebaseapp.com',
    storageBucket: 'vehicle-services-3c12b.appspot.com',
    measurementId: 'G-M58K2V38NT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCOMVYGgVDJB_n-eWH9OYtiOzST0K-AHCQ',
    appId: '1:1046317937993:android:4649ee34daf64d242d1698',
    messagingSenderId: '1046317937993',
    projectId: 'vehicle-services-3c12b',
    storageBucket: 'vehicle-services-3c12b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDLcGkk7xk7DG_CqmIYwnruZ3_bygXPZU8',
    appId: '1:1046317937993:ios:c2db16298305523d2d1698',
    messagingSenderId: '1046317937993',
    projectId: 'vehicle-services-3c12b',
    storageBucket: 'vehicle-services-3c12b.appspot.com',
    iosClientId: '1046317937993-54h3m7pdecgpo9lu3qj4stq8ngn7uq53.apps.googleusercontent.com',
    iosBundleId: 'com.example.vehicleServiceApp',
  );
}
