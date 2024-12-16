import 'package:barrel_files_annotation/barrel_files_annotation.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:injectable/injectable.dart';

@includeInBarrelFile
@lazySingleton
class Monitoring {
  const Monitoring(this._firebase);

  final FirebaseCrashlytics _firebase;

  Future<void> log(String message) async {
    await _firebase.log('log: $message');
  }
}
