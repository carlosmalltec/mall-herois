import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:malltec_heroes/components/styles/const_colors.dart';
import 'package:oktoast/oktoast.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return OKToast(
      position: ToastPosition.top,
      handleTouch: true,
      dismissOtherOnShow: true,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Heróis',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: ConstColors.blueStrong,
          ),
          useMaterial3: true,
        ),
        routerConfig: Modular.routerConfig,
      ),
    );
  }
}
