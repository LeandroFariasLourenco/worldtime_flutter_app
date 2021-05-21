abstract class AutocompleteEntity {
  Map<String, dynamic> toMap() {
    return {};
  }

  dynamic get(String propertyName) {
    Map classMap = this.toMap();
    if (classMap.containsKey(propertyName)) {
      return classMap[propertyName];
    }
    throw ArgumentError('Property name not found');
  }
}
