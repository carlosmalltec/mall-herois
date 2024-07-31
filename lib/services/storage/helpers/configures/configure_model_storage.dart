
import '../entity.dart';


class ConfigureModelStorage extends Entity {
  final int? cursorTime;
  final String types;

  ConfigureModelStorage({
    required this.cursorTime,
    required this.types,
  });

  @override
  factory ConfigureModelStorage.fromMap(Map<String, dynamic> json) => ConfigureModelStorage(
        cursorTime: json["CursorTime"],
        types: json["Types"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "CursorTime": cursorTime,
        "Types": types,
      };
}
