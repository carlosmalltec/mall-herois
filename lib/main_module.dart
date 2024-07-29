import 'package:flutter_modular/flutter_modular.dart';

import './features/splash/module_splash.dart';

class MainModule extends Module {
  @override
  void binds(Injector i) {
    // i.addLazySingleton(() => OnboardingStore());
    super.binds(i);
  }

  @override
  List<Module> get imports => [
        // CoreModule(),
      ];

  @override
  void routes(RouteManager r) {
    r.module(Modular.initialRoute, module: ModuleSplash());
    super.routes(r);
  }
}
