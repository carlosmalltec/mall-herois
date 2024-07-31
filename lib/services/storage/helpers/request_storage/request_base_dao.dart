
import '../../../../constants/const_tables.dart';
import './request_model_storage.dart';

import '../base_dao.dart';

class RequestBaseDao extends BaseDAO<RequestModelStorage> {
  @override
  String get tableName => ConstTables.requests;

  @override
  RequestModelStorage fromMap(Map<String, dynamic> map) =>
      RequestModelStorage.fromMap(map);
}
