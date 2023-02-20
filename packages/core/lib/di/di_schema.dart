import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';

abstract class DiSchema {
  final getIt = GetIt.instance;
  late final String key;
  get middlewaresKey => '$key/middlewares';

  DiSchema() {
    key = const Uuid().v4();
    registerDataSources();
    registerRepositories();
    registerMiddlewares();
  }

  void registerDataSources() {}

  void registerRepositories() {}

  void registerMiddlewares() {}
}
