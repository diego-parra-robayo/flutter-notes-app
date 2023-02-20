import 'package:redux/redux.dart';
import 'package:redux_core/failure/failure.dart';
import 'package:redux_core/store/app_state.dart';

abstract class CustomMiddleware<Action> extends MiddlewareClass<AppState> {
  Future execute(Store<AppState> store, Action action);

  void onFailure(Store<AppState> store, Action action, Failure failure);

  Failure mapError(dynamic e, StackTrace stackTrace) {
    //  TODO: Here can be mapped most common errors in the app.
    if (e is Failure) {
      return e;
    } else {
      return Failure(message: e.toString());
    }
  }

  void onDispose(Store<AppState> store, dynamic action, NextDispatcher next) {}

  @override
  dynamic call(
    Store<AppState> store,
    dynamic action,
    NextDispatcher next,
  ) async {
    if (action is Action) {
      try {
        return await execute(store, action);
      } catch (e, stackTrace) {
        final failure = mapError(e, stackTrace);
        return onFailure(store, action, failure);
      }
    } else {
      return next(action);
    }
  }
}
