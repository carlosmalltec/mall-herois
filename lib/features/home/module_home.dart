import 'package:flutter_modular/flutter_modular.dart';
import 'package:malltec_heroes/constants/const_pages.dart';

import '../../components/dropdown_category/dropdown_category_controller.dart';
import '../../services/categorys/store/category_store.dart';
import '../../services/heroes/store/heroes_store.dart';
import 'controllers/home_controllers.dart';
import 'controllers/heroes_controllers.dart';
import 'pages/details_screen.dart';
import 'pages/home_screen.dart';
import 'pages/register_heroes_screen.dart';
import 'pages/update_heroes_screen.dart';

class ModuleHome extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<HomeControllers>(
      () => HomeControllers(
        heroesStore: Modular.get<HeroesStore>(),
      ),
    );
    i.addLazySingleton<HeroesControllers>(
      () => HeroesControllers(
        heroesStore: Modular.get<HeroesStore>(),
      ),
    );
    i.addLazySingleton<DropdownCategoryController>(
      () => DropdownCategoryController(
        categoryStore: Modular.get<CategoryStore>(),
      ),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (context) => HomeScreen(
        controller: context.read<HomeControllers>(),
      ),
      transition: TransitionType.rightToLeft,
    );
    r.child(
      ConstPages.registerHeroesModule,
      child: (context) => RegisterHeroesScreen(
        controller: context.read<HeroesControllers>(),
        categoryController: context.read<DropdownCategoryController>(),
      ),
      transition: TransitionType.rightToLeft,
    );
    r.child(
      ConstPages.detailsHeroesModule,
      child: (context) => DetailsScreen(
        model: r.args.data,
        controller: context.read<HeroesControllers>(),
      ),
      transition: TransitionType.rightToLeft,
    );
    r.child(
      ConstPages.updateHeroesModule,
      child: (context) => UpdateHeroesScreen(
        model: r.args.data,
         controller: context.read<HeroesControllers>(),
        categoryController: context.read<DropdownCategoryController>(),
      ),
      transition: TransitionType.rightToLeft,
    );
  }
}
