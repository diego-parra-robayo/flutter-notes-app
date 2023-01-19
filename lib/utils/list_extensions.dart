extension ListExtensions<T> on List<T> {
  T? firstOrNull(bool Function(T element) fn) {
    for (T element in this) {
      if (fn(element)) return element;
    }
    return null;
  }
}
