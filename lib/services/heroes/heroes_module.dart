import 'package:flutter_modular/flutter_modular.dart';
import '../storage/helpers/heroes/heroes_base_dao.dart';

import '../rest_client/check_state_network/check_network.dart';
import '../rest_client/rest_client.dart';
import '../storage/helpers/cache_save_heroes/save_heroes_cache.dart';
import '../storage/helpers/configures/configure_base_dao.dart';
import '../storage/helpers/request_storage/request_base_dao.dart';
import './data/repositories/heroes_repository.dart';
import './store/heroes_store.dart';

class ModuleHeroes extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton<HeroesRepository>(
      () => HeroesRepository(
        Modular.get<RestClient>(),
      ),
    );
    i.addLazySingleton<HeroesStore>(
      () => HeroesStore(
        repository: Modular.get<HeroesRepository>(),
        checkInternet: CheckInternet(),
        heroesBaseDAO: HeroesBaseDAO(),
        requestBaseDao: RequestBaseDao(),
        cacheHeroes: SaveHeroesToCache(
          heroesBaseDAO: HeroesBaseDAO(),
          configureBaseDAO: ConfigureBaseDAO(),
        ),
      ),
    );
  }
}
