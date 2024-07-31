import 'package:sqflite/sqflite.dart';

import '../../../../constants/const_tables.dart';
import '../base_dao.dart';
import 'heroes_model_storage.dart';

class HeroesBaseDAO extends BaseDAO<HeroesModelStorage> {
  @override
  String get tableName => ConstTables.heroes;

  @override
  HeroesModelStorage fromMap(Map<String, dynamic> map) =>
      HeroesModelStorage.fromMap(map);

  Future<List<Object?>> insertListHeroes(
      List<HeroesModelStorage> employees) async {
    var dbClient = await db;
    late List<Object?> results;
    await dbClient.transaction((txn) async {
      var batch = txn.batch();
      for (var emp in employees) {
        batch.insert(tableName, emp.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace);
      }
      results = await batch.commit();
    });
    return results;
  }
}
