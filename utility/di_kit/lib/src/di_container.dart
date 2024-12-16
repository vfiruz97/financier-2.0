import 'package:barrel_files_annotation/barrel_files_annotation.dart';
import 'package:di_kit/src/di_initializer.dart.dart';
import 'package:get_it/get_it.dart';

@includeInBarrelFile
final diContainer = _DIContainer(_getIt);

@includeInBarrelFile
Future<DIContainer> initializeDIContainer(
  List<DIInitializer> initializers,
) async {
  for (final initializer in initializers) {
    await initializer.init(_getIt);
  }
  return diContainer;
}

abstract class DIContainer {
  T call<T extends Object>({dynamic parameter, String? name});

  bool isRegistered<T extends Object>({String? name});
}

final _getIt = GetIt.instance;

class _DIContainer implements DIContainer {
  const _DIContainer(this._getIt);

  final GetIt _getIt;

  @override
  T call<T extends Object>({dynamic parameter, String? name}) => _getIt<T>(param1: parameter, instanceName: name);

  @override
  bool isRegistered<T extends Object>({String? name}) => _getIt.isRegistered<T>(instanceName: name);
}
