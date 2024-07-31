import 'package:malltec_heroes/services/storage/helpers/configures/type_configure.dart';
import 'package:malltec_heroes/services/storage/helpers/heroes/heroes_base_dao.dart';

import '../configures/configure_base_dao.dart';
import '../configures/configure_model_storage.dart';
import '../heroes/heroes_model_storage.dart';

class SaveHeroesToCache {
  final ConfigureBaseDAO _configureBaseDAO;
  final HeroesBaseDAO _heroesBaseDAO;

  SaveHeroesToCache({
    required ConfigureBaseDAO configureBaseDAO,
    required HeroesBaseDAO heroesBaseDAO,
  })  : _heroesBaseDAO = heroesBaseDAO,
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

  Future<void> saveHeroesTimeCache(
      List<HeroesModelStorage> listHeroes) async {
    final result =
        await _configureBaseDAO.findConfigure(TypeConfigures.heroes);
    final dateTimeAdd = _timeAdd();

    if (result != null) {
      final timeCache = result['CursorTime'] as int;
      final bool isValidTime = _validTime(timeCache);
      if (isValidTime) {
        await Future.wait([
          _heroesBaseDAO.deleteAll(),
          _configureBaseDAO.updateConfigure(
              types: TypeConfigures.heroes, cursorTime: dateTimeAdd),
          _heroesBaseDAO.insertListHeroes(listHeroes),
        ]);
      }
    } else {
      final cacheTime = ConfigureModelStorage(
        types: TypeConfigures.heroes.name.toString(),
        cursorTime: dateTimeAdd,
      );
      await Future.wait([
        _configureBaseDAO.save(cacheTime),
        _heroesBaseDAO.insertListHeroes(listHeroes),
      ]);
    }
  }
}
