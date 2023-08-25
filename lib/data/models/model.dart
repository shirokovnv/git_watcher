abstract class Model {
  const Model();

  Model.fromJson(Map json);
  Map toJson();

  @override
  String toString() {
    return toJson().toString();
  }
}
