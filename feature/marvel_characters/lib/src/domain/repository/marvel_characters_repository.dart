import 'package:foundation_kit/foundation_kit.dart';
import 'package:injectable/injectable.dart';
import 'package:marvel_characters/src/domain/api/marvel_characters_api.dart';
import 'package:marvel_characters/src/domain/model/marvel_character.dart';

@injectable
class MarvelCharactersRepository {
  const MarvelCharactersRepository(this._api);

  final MarvelCharactersApi _api;

  Future<Result<List<MarvelCharacter>, Exception>> getCharacters() async {
    final result = await Result.fromAsync(_api.getCharacters);
    return result.map((s) => s.data.characters);
  }
}
