class RequestModel {
  final int? id;
  final String? name;
  final bool? active;
  final int? categoryId;

  RequestModel({
    this.id,
    this.name,
    this.active,
    this.categoryId,
  });

  RequestModel copyWith({
    int? id,
    String? name,
    bool? active,
    int? categoryId,
  }) =>
      RequestModel(
        id: id ?? this.id,
        name: name ?? this.name,
        active: active ?? this.active,
        categoryId: categoryId ?? this.categoryId,
      );

  factory RequestModel.fromMap(Map<String, dynamic> json) => RequestModel(
        name: json["Name"],
        id: json["Id"],
        active: json["Active"],
        categoryId: json["CategoryId"],
      );

  Map<String, dynamic> toMap() => {
        "Name": name,
        "Id": id,
        "Active": active,
        "CategoryId": categoryId,
      };
}
