// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:feature_flow/feature_flow.dart' as _i114;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:marvel_characters/src/domain/api/marvel_characters_api.dart'
    as _i425;
import 'package:marvel_characters/src/domain/repository/marvel_characters_repository.dart'
    as _i71;
import 'package:marvel_characters/src/flow/marvel_characters_flow_state.dart'
    as _i709;
import 'package:marvel_characters/src/presentation/bloc/marvel_characters_bloc.dart'
    as _i378;
import 'package:monitoring_kit/monitoring_kit.dart' as _i245;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i425.MarvelCharactersApi>(
        () => _i425.MarvelCharactersApi(gh<_i361.Dio>()));
    gh.factory<_i71.MarvelCharactersRepository>(
        () => _i71.MarvelCharactersRepository(gh<_i425.MarvelCharactersApi>()));
    gh.factory<_i378.MarvelCharactersBloc>(() => _i378.MarvelCharactersBloc(
          gh<_i71.MarvelCharactersRepository>(),
          gh<_i245.Monitoring>(),
          gh<_i114.FeatureFlowController<_i709.MarvelCharactersFlowState>>(),
        ));
    return this;
  }
}
