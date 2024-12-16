// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i141;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:monitoring_kit/src/monitoring.dart' as _i564;
import 'package:monitoring_kit/src/monitoring_module.dart' as _i389;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final monitoringModule = _$MonitoringModule();
    await gh.singletonAsync<_i141.FirebaseCrashlytics>(
      () => monitoringModule.getCrashlytics(),
      preResolve: true,
    );
    gh.lazySingleton<_i564.Monitoring>(
        () => _i564.Monitoring(gh<_i141.FirebaseCrashlytics>()));
    return this;
  }
}

class _$MonitoringModule extends _i389.MonitoringModule {}
