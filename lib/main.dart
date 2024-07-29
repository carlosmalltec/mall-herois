import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import './my_app.dart';
import './main_module.dart';

void main() {
   runApp(ModularApp(module: MainModule(), child: const MyApp()));
}
