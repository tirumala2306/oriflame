import 'package:flutter/material.dart';
import 'package:oriflame/app/app.dart';

class AppBootstrap {
  static Future<void> run() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const OriflameApp());
  }
}
