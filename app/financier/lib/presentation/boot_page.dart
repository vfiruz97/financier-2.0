import 'package:design_system_kit/design_system_kit.dart';
import 'package:financier/di/di_initializer.dart';
import 'package:flutter/material.dart';
import 'package:marvel_characters/marvel_characters.dart';

class BootPage extends StatefulWidget {
  const BootPage({super.key});

  @override
  State<BootPage> createState() => _BootPageState();
}

class _BootPageState extends State<BootPage> {
  final initialization = initDi();

  @override
  Widget build(BuildContext context) => FutureBuilder(
      future: initialization,
      builder: (context, shapshot) {
        if (shapshot.connectionState == ConnectionState.done) {
          return const MarvelCharactersFlow();
        }
        return const Loading();
      });
}
