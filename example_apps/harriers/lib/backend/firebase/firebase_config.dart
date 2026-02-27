import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBBWiPauybJer2ONb2t_7K_3tLFgesiIkU",
            authDomain: "kidderminster-harriers-bpdeg0.firebaseapp.com",
            projectId: "kidderminster-harriers-bpdeg0",
            storageBucket: "kidderminster-harriers-bpdeg0.firebasestorage.app",
            messagingSenderId: "907610249864",
            appId: "1:907610249864:web:4e79c3112c8e15124e9d3d",
            measurementId: "G-75BZ7HBDBS"));
  } else {
    await Firebase.initializeApp();
  }
}
