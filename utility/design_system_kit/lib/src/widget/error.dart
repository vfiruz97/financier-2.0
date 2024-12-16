import 'package:barrel_files_annotation/barrel_files_annotation.dart';
import 'package:flutter/material.dart';

@includeInBarrelFile
class Error extends StatelessWidget {
  const Error({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) => Center(
        child: Text(message),
      );
}
