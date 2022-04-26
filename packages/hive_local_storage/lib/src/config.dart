import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_local_storage/hive_local_storage.dart';

class TypeId {
  const TypeId._();

  static const genreTypeId = 0;
}

class OpenBox {
  const OpenBox._();

  static Future<Box<GenreEntity>> genres() => Hive.openBox('genres');

  static Future<Box<int>> favoriteMovies() => Hive.openBox('favoriteMovies');
}
