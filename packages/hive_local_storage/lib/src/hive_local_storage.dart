import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_local_storage/hive_local_storage.dart';

/// {@template hive_local_storage}
/// Local database for caching and more for Flutter
/// {@endtemplate}
class HiveLocalStorage {
  /// {@macro hive_local_storage}
  const HiveLocalStorage._();

  static Future<void> initialize() async {
    await Hive.initFlutter();

    Hive.registerAdapter(GenreEntityAdapter());
  }
}
