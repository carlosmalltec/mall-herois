import 'package:flutter_modular/flutter_modular.dart';

import './pages/splash_screen.dart';
import './controllers/splash_controller.dart';

class ModuleSplash extends Module {
  @override
  void binds(Injector i) {
    i.add<SplashController>(
      () => SplashController(),
    );
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (context) => SplashScreen(
        controller: context.read<SplashController>(),
      ),
    );
    super.routes(r);
  }
}
