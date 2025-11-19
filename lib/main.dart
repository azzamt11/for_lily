import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:for_lily/core/app.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //await Stetho.initialize();

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const App());
}