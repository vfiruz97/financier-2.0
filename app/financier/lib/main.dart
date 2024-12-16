import 'package:design_system_kit/design_system_kit.dart';
import 'package:financier/presentation/boot_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Financier',
        theme: themeData,
        home: const BootPage(),
      );
}
