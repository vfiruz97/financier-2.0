import 'package:barrel_files_annotation/barrel_files_annotation.dart';
import 'package:feature_flow/feature_flow.dart';
import 'package:flutter/material.dart';
import 'package:marvel_characters/src/di/di_initializer.dart';
import 'package:marvel_characters/src/flow/marvel_characters_flow_state.dart';
import 'package:marvel_characters/src/presentation/character_details_page.dart';
import 'package:marvel_characters/src/presentation/marvel_characters_page.dart';

@includeInBarrelFile
class MarvelCharactersFlow extends StatelessWidget {
  const MarvelCharactersFlow({super.key});

  @override
  Widget build(BuildContext context) => FeatureFlow<MarvelCharactersFlowState>(
        flowInitializer: MarvelCharactersDIInitializer(),
        state: const MarvelCharactersFlowState(),
        onGeneratePages: (state) => [
          MarvelCharactersPage(),
          if (state.selectedCharacter != null) CharacterDetailsPage(character: state.selectedCharacter!),
        ],
      );
}
