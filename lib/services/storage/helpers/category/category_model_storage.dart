
import '../entity.dart';

class CategoryModelStorage extends Entity {
  final int? id;
  final String? name;

  CategoryModelStorage({
    this.id,
    this.name,
  });

  @override
  factory CategoryModelStorage.fromMap(Map<String, dynamic> json) => CategoryModelStorage(
        id: json["Id"],
        name: json["Name"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "Id": id,
        "Name": name,
      };
}
