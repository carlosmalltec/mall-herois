
import 'package:flutter_modular/flutter_modular.dart';

import '../rest_client/rest_client.dart';
import 'data/repositories/heroes_repository.dart';

class ModuleHeroes extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton<HeroesRepository>(
      () => HeroesRepository(
        i.get<RestClient>(),
      ),
    );
  }
}
