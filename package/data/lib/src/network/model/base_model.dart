abstract class BaseModel extends Object {
  const BaseModel();
  String get keyMap;

  @override
  String toString() {
    return keyMap;
  }
}
