import 'dart:collection';

extension MapExtension<K, V> on Map<K, V> {
  void sort() {
    SplayTreeMap<K, V> map = SplayTreeMap();
    forEach((key, value) => map[key] = value);
    clear();
    map.forEach((key, value) => this[key] = value);
  }
}
