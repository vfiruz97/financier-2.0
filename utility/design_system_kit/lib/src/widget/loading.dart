import 'package:barrel_files_annotation/barrel_files_annotation.dart';
import 'package:flutter/material.dart';

@includeInBarrelFile
class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) => const Center(
        child: CircularProgressIndicator(),
      );
}
