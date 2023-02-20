import 'package:redux/redux.dart';

import 'app_reducer.dart';
import 'app_state.dart';

Store<AppState> createStore({
  required List<Middleware<AppState>> middleware,
}) =>
    Store(
      appReducer,
      initialState: AppState.initial(),
      middleware: middleware,
    );
