import 'dart:async';

import 'package:api_client/src/di/di_initializer.config.dart';
import 'package:barrel_files_annotation/barrel_files_annotation.dart';
import 'package:di_kit/di_kit.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@includeInBarrelFile
class ApiClientDIInitializer extends DIInitializer {
  const ApiClientDIInitializer() : super(_init);
}

@injectableInit
FutureOr<GetIt> _init(GetIt getIt, String? environment) => getIt.init(environment: environment);
