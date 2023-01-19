extension ListExtensions<T> on List<T> {
  T? firstOrNull(bool Function(T element) fn) {
    for (T element in this) {
      if (fn(element)) return element;
    }
    return null;
  }

  List<T> findAndReplace({
    required bool Function(T item) find,
    required T Function(T item) replace,
  }) {
    final result = <T>[];
    for (T item in this) {
      if (find(item)) {
        result.add(replace(item));
      } else {
        result.add(item);
      }
    }
    return result;
  }
}
