import 'package:barrel_files_annotation/barrel_files_annotation.dart';
import 'package:design_system_kit/design_system_kit.dart';
import 'package:di_kit/di_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_characters/src/domain/model/marvel_character.dart';
import 'package:marvel_characters/src/presentation/bloc/marvel_characters_bloc.dart';

@includeInBarrelFile
class MarvelCharactersPage extends StatelessWidget {
  const MarvelCharactersPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => diContainer<MarvelCharactersBloc>(),
        child: const _MarvelCharactersPageContent(),
      );
}

class _MarvelCharactersPageContent extends StatelessWidget {
  const _MarvelCharactersPageContent();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocBuilder<MarvelCharactersBloc, MarvelCharactersState>(
          builder: (context, state) => state.when(
            loading: () => const Loading(),
            error: (e) => Error(message: e.toString()),
            success: (characters) => CharacterList(characters: characters),
          ),
        ),
      );
}

class CharacterList extends StatelessWidget {
  const CharacterList({super.key, required this.characters});

  final List<MarvelCharacter> characters;

  @override
  Widget build(BuildContext context) => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: characters.length,
        itemBuilder: (_, index) => CharacterItem(character: characters[index]),
      );
}

class CharacterItem extends StatelessWidget {
  const CharacterItem({super.key, required this.character});

  final MarvelCharacter character;

  @override
  Widget build(BuildContext context) => Card(
        child: InkWell(
          onTap: () => context.read<MarvelCharactersBloc>().add(
                MarvelCharactersEvent.openCharacter(character),
              ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Image.network(character.thumbnail.url),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(character.name),
              ),
            ],
          ),
        ),
      );
}
