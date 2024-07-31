import '../category/category_model_storage.dart';
import '../entity.dart';

class HeroesModelStorage extends Entity {
  final int? id;
  final String? name;
  final int? active;
  final CategoryModelStorage? category;

  HeroesModelStorage({
    this.id,
    this.name,
    this.active,
    this.category,
  });

  @override
  factory HeroesModelStorage.fromMap(Map<String, dynamic> json) =>
      HeroesModelStorage(
          id: json["Id"],
          name: json["Name"],
          active: json["Active"],
          category: json["Category"] != null
              ? CategoryModelStorage.fromMap(json["Category"])
              : null);

  @override
  Map<String, dynamic> toMap() => {
        "Id": id,
        "Name": name,
        "Active": active,
        "Category": category?.toMap(),
      };
}
