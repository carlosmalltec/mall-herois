import 'package:malltec_heroes/services/storage/helpers/configures/type_configure.dart';

import '../category/category_base_dao.dart';
import '../category/category_model_storage.dart';
import '../configures/configure_base_dao.dart';
import '../configures/configure_model_storage.dart';

class SaveCategoryToCache {
  final ConfigureBaseDAO _configureBaseDAO;
  final CategoryBaseDAO _categoryBaseDAO;

  SaveCategoryToCache({
    required ConfigureBaseDAO configureBaseDAO,
    required CategoryBaseDAO categoryBaseDAO,
  })  : _categoryBaseDAO = categoryBaseDAO,
        _configureBaseDAO = configureBaseDAO;

  int _intParse() {
    try {
      const timeDefault = String.fromEnvironment('TIME_CACHE_MINUTES');
      return int.parse(timeDefault);
    } catch (e) {
      return 5;
    }
  }

  int _timeAdd() {
    return DateTime.now()
        .add(Duration(minutes: _intParse()))
        .millisecondsSinceEpoch;
  }

  bool _validTime(int timeCache) {
    final timeNow = DateTime.now().millisecondsSinceEpoch;
    return timeNow > timeCache;
  }

  Future<void> saveCategoryTimeCache(
      List<CategoryModelStorage> listCategorys) async {
    final result =
        await _configureBaseDAO.findConfigure(TypeConfigures.category);
    final dateTimeAdd = _timeAdd();

    if (result != null) {
      final timeCache = result['CursorTime'] as int;
      final bool isValidTime = _validTime(timeCache);
      if (isValidTime) {
        await Future.wait([
          _categoryBaseDAO.deleteAll(),
          _configureBaseDAO.updateConfigure(
              types: TypeConfigures.category, cursorTime: dateTimeAdd),
          _categoryBaseDAO.insertListCategorys(listCategorys),
        ]);
      }
    } else {
      final cacheTime = ConfigureModelStorage(
        types: TypeConfigures.category.name,
        cursorTime: dateTimeAdd,
      );
      await Future.wait([
        _configureBaseDAO.save(cacheTime),
        _categoryBaseDAO.insertListCategorys(listCategorys),
      ]);
    }
  }
}
