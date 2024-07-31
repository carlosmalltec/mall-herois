import '../entity.dart';

class RequestModelStorage extends Entity {
  final int? id;
  final String? name;
  final int? categoryId;
  final int? active;
  final int? created;
  final String? typeRequest;

  RequestModelStorage({
    this.id,
    this.name,
    this.categoryId,
    this.active,
    this.created,
    this.typeRequest,
  });

  @override
  factory RequestModelStorage.fromMap(Map<String, dynamic> json) =>
      RequestModelStorage(
        id: json["Id"],
        name: json["Name"],
        categoryId: json["CategoryId"],
        active: json["Active"],
        created: json["Created"],
        typeRequest: json["TypeRequest"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "Id": id,
        "Name": name,
        "CategoryId": categoryId,
        "Active": active,
        "Created": created,
        "TypeRequest": typeRequest,
      };
}
