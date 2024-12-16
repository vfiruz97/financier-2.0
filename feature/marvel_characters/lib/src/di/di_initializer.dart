import 'dart:async';

import 'package:barrel_files_annotation/barrel_files_annotation.dart';
import 'package:di_kit/di_kit.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:marvel_characters/src/di/di_initializer.config.dart';

@includeInBarrelFile
class MarvelCharactersDIInitializer extends DIInitializer {
  const MarvelCharactersDIInitializer() : super(_init);
}

@injectableInit
FutureOr<GetIt> _init(GetIt getIt, String? environment) => getIt.init(environment: environment);
