
import '../../../categorys/data/models/category_model.dart';

class HeroesModel {
  final String name;
  final int id;
  final bool active;
  final CategoryModel category;

  HeroesModel({
    required this.name,
    required this.id,
    required this.active,
    required this.category,
  });

  HeroesModel copyWith({
    String? name,
    int? id,
    bool? active,
    CategoryModel? category,
  }) =>
      HeroesModel(
        name: name ?? this.name,
        id: id ?? this.id,
        active: active ?? this.active,
        category: category ?? this.category,
      );

  factory HeroesModel.fromMap(Map<String, dynamic> json) => HeroesModel(
        name: json["Name"],
        id: json["Id"],
        active: json["Active"],
        category: json["Category"] != null
            ? CategoryModel.fromMap(json["Category"])
            : CategoryModel.empty(),
      );

  Map<String, dynamic> toMap() => {
        "Name": name,
        "Id": id,
        "Active": active,
        "Category": category.toMap(),
      };
}
