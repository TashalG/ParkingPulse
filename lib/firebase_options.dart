import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB-b79QXXEeDjTbdFugL3wal3YqGltn__w',
    appId: '1:1022756281840:android:dd467a3abb42c973d6d135',
    messagingSenderId: '1022756281840',
    projectId: 'parkingpulse-4e8ac',
    storageBucket: 'parkingpulse-4e8ac.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDLoMrmL3IUT1MENy-OgX8jWpnvU35UPMc',
    appId: '1:1022756281840:ios:ca34d4a0351052c8d6d135',
    messagingSenderId: '1022756281840',
    projectId: 'parkingpulse-4e8ac',
    storageBucket: 'parkingpulse-4e8ac.firebasestorage.app',
    iosBundleId: 'com.example.parkingLotSystem',
  );
}
