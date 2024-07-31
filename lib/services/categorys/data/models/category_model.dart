class CategoryModel {
  final int id;
  final String name;

  CategoryModel({
    required this.name,
    required this.id,
  });

  CategoryModel copyWith({
    String? name,
    int? id,
  }) =>
      CategoryModel(
        name: name ?? this.name,
        id: id ?? this.id,
      );

  factory CategoryModel.fromMap(Map<String, dynamic> json) =>
      CategoryModel(
        name: json["Name"],
        id: json["Id"],
      );
  factory CategoryModel.empty() =>
      CategoryModel(
        name: '-',
        id: 0,
      );

  Map<String, dynamic> toMap() => {
        "Name": name,
        "Id": id,
      };
}