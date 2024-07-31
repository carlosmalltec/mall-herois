import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:malltec_heroes/services/storage/connection/connection_sqflite.dart';

import './my_app.dart';
import './main_module.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ApplicationStartConfig.configure();
  runApp(ModularApp(module: MainModule(), child: const MyApp()));
}

class ApplicationStartConfig {
  static Future<void> _databaseSqflite() async => await ConnectionSqfliteService.getInstance().db;
  static Future<void> configure() async {
    await _databaseSqflite();
  }
}