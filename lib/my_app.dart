import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mall_horeis/constants/const_colors.dart';

import 'features/home/pages/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Heróis',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(ConstColors.orangeLight),
        ),
        useMaterial3: true,
      ),
      routerConfig: Modular.routerConfig,
    );
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Heróis',
    //   locale: const Locale('pt', 'BR'),
    //   theme: ThemeData(
    //     colorScheme: ColorScheme.fromSeed(
    //       seedColor: const Color(ConstColors.orangeLight),
    //     ),
    //     useMaterial3: true,
    //   ),
    //   home: const HomeScreen(title: 'Flutter Demo Home Page'),
    // );
  }
}
