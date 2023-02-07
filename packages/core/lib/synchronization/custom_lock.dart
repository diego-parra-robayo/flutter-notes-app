import 'dart:async';

class CustomLock {
  Future? _isWorking;
  final Map<int, bool> _initialized = {};

  Future<T> synchronized<T>(Future<T> Function() fn) async {
    if (_isWorking != null) await _isWorking;

    final completer = Completer();
    _isWorking = completer.future;

    final result = await fn.call();

    completer.complete();
    _isWorking = null;
    return result;
  }

  void synchronizedRunOnce(dynamic Function() fn, {int id = 1}) {
    synchronized(() async {
      if (_initialized[id] == true) return;
      await fn();
      _initialized[id] = true;
    });
  }
}
