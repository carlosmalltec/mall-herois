import '../category/category_model_storage.dart';
import '../entity.dart';

class HeroesModelStorage extends Entity {
  final int? id;
  final String? name;
  final CategoryModelStorage? categorys;

  HeroesModelStorage({
    this.id,
    this.name,
    this.categorys,
  });

  @override
  factory HeroesModelStorage.fromMap(Map<String, dynamic> json) =>
      HeroesModelStorage(
          id: json["Id"],
          name: json["Name"],
          categorys: json["Categorys"] != null
              ? CategoryModelStorage.fromMap(json["Categorys"])
              : null);

  @override
  Map<String, dynamic> toMap() => {
        "Id": id,
        "Name": name,
        "Categorys": categorys?.toMap(),
      };
}
