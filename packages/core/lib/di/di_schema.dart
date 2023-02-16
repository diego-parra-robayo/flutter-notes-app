import 'package:get_it/get_it.dart';

abstract class DiSchema {
  final getIt = GetIt.instance;

  DiSchema() {
    registerDataSources();
    registerRepositories();
    registerMiddlewares();
  }

  void registerDataSources() {}

  void registerRepositories() {}

  void registerMiddlewares() {}
}
