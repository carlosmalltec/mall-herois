import 'package:flutter_modular/flutter_modular.dart';
import 'package:malltec_heroes/constants/const_pages.dart';

import './features/splash/module_splash.dart';
import './services/categorys/category_module.dart';
import './services/heroes/heroes_module.dart';
import './services/rest_client/dio_rest_client.dart';
import './services/rest_client/rest_client.dart';
import 'features/home/module_home.dart';

class MainModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<RestClient>(
      () => DioRestClient(),
    );

    super.binds(i);
  }

  @override
  List<Module> get imports => [
        ModuleCategory(),
        ModuleHeroes(),
      ];

  @override
  void routes(RouteManager r) {
    r.module(Modular.initialRoute, module: ModuleSplash());
    r.module(ConstPages.home, module: ModuleHome());
    super.routes(r);
  }
}
