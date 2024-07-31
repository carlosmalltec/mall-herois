
import '../../../../constants/const_tables.dart';
import '../base_dao.dart';
import 'heroes_storage.dart';

class HeroesStorage extends BaseDAO<HeroesModelStorage> {
  @override
  String get tableName => ConstTables.heroes;

  @override
  HeroesModelStorage fromMap(Map<String, dynamic> map) =>
      HeroesModelStorage.fromMap(map);
}
