import 'package:flutter_modular/flutter_modular.dart';

import '../rest_client/check_state_network/check_network.dart';
import '../rest_client/rest_client.dart';
import '../storage/helpers/cache_save_category/save_category_cache.dart';
import '../storage/helpers/category/category_base_dao.dart';
import '../storage/helpers/configures/configure_base_dao.dart';
import './data/repositories/category_repository.dart';
import './store/category_store.dart';

class ModuleCategory extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton<CategoryRepository>(
      () => CategoryRepository(
        Modular.get<RestClient>(),
      ),
    );
    i.addLazySingleton<CategoryStore>(
      () => CategoryStore(
        repository: Modular.get<CategoryRepository>(),
        checkInternet: CheckInternet(),
        categoryBaseDAO: CategoryBaseDAO(),
        cacheCategorys: SaveCategoryToCache(
          categoryBaseDAO: CategoryBaseDAO(),
          configureBaseDAO: ConfigureBaseDAO(),
        ),
      ),
    );
  }
}
