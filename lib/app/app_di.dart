import 'package:auth/di/auth_di.dart';
import 'package:auth/domain/middlewares/middlewares.dart';
import 'package:auth/navigation/auth_routes.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/di/notes_di.dart';
import 'package:notes/navigation/notes_routes.dart';

class AppDi {
  static final GetIt getIt = GetIt.instance;

  static void init() {
    getIt.registerSingleton<AuthDi>(
      AuthDi(
        onAuthenticatedSuccess: (context) => context.goNamed(NotesRoute.home),
      ),
    );
    getIt.registerSingleton<NotesDi>(
      NotesDi(
        onSignOut: (store) => store.dispatch(const SignOutRequest()),
        onSignedOut: (context) => context.goNamed(AuthRoute.signIn),
      ),
    );
  }
}
