import '../../../../constants/const_tables.dart';
import './configure_model_storage.dart';

import '../base_dao.dart';
import './type_configure.dart';

class ConfigureBaseDAO extends BaseDAO<ConfigureModelStorage> {
  @override
  String get tableName => ConstTables.configures;

  @override
  ConfigureModelStorage fromMap(Map<String, dynamic> map) =>
      ConfigureModelStorage.fromMap(map);

  Future<Map<String, Object?>?> findConfigure(TypeConfigures types) async {
    var dbClient = await db;
    final list = await dbClient
        .rawQuery('select * from $tableName where Types = ?', [types.name.toString()]);
    return list.isNotEmpty ? list.first : null;
  }

  Future<bool> deleteConfigure(TypeConfigures types) async {
   
    var dbClient = await db;
    final list = await dbClient
        .rawQuery('delete from $tableName where Types = ?', [types.name.toString()]);
    return list.isNotEmpty;
  }

  Future<bool> updateConfigure(
      {required TypeConfigures types, required int cursorTime}) async {
    try {
      var dbClient = await db;
      final results = await dbClient.rawUpdate(
          'update $tableName set CursorTime = ? where Types = ?',
          [cursorTime, types.name.toString()]);
      return results != 0;
    } catch (e) {
      return false;
    }
  }
}
