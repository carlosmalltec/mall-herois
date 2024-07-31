import 'package:flutter_modular/flutter_modular.dart';

import '../../components/dropdown_category/dropdown_category_controller.dart';
import '../../services/categorys/store/category_store.dart';
import 'controllers/home_controllers.dart';
import 'pages/home_screen.dart';

class ModuleHome extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<HomeControllers>(
      () => HomeControllers(),
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
        categoryController: context.read<DropdownCategoryController>(),
      ),
      transition: TransitionType.rightToLeft,
    );
  }
}
