import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:for_lily/core/app.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //await Stetho.initialize();

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDidctR4nTEC5fMbzray0trgoV5vTRYM-c",
      appId: "1:638416343468:android:c00adef6186fa43bdf2a09",
      messagingSenderId: "638416343468",
      projectId: "for-lily-project",
    ),
  );

  runApp(const App());
}