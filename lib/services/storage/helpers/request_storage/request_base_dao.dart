import '../../../../constants/const_tables.dart';
import './request_model_storage.dart';

import '../base_dao.dart';

class RequestBaseDao extends BaseDAO<RequestModelStorage> {
  @override
  String get tableName => ConstTables.requests;

  @override
  RequestModelStorage fromMap(Map<String, dynamic> map) =>
      RequestModelStorage.fromMap(map);

  Future<bool> deleteRequest(int created) async {
    var dbClient = await db;
    final list = await dbClient
        .rawQuery('delete from $tableName where Created = ?', [created]);
    return list.isNotEmpty;
  }
}
