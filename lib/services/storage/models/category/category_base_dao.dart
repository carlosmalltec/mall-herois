import 'package:sqflite/sqflite.dart';

import '../../../../constants/const_tables.dart';
import '../../models/category/category_model_storage.dart';

import '../base_dao.dart';

class CategoryBaseDAO extends BaseDAO<CategoryModelStorage> {
  @override
  String get tableName => ConstTables.category;

  @override
  CategoryModelStorage fromMap(Map<String, dynamic> map) =>
      CategoryModelStorage.fromMap(map);

  Future<List<Object?>> insertListCategorys(
      List<CategoryModelStorage> employees) async {
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
