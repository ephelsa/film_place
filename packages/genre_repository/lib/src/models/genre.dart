import 'package:equatable/equatable.dart';
import 'package:hive_local_storage/hive_local_storage.dart';
import 'package:the_movie_db_api/the_movie_db_api.dart';

class Genre extends Equatable {
  const Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromGenreRemote(GenreRemote remote) {
    return Genre(
      id: remote.id,
      name: remote.name,
    );
  }

  factory Genre.fromGenreEntity(GenreEntity entity) {
    return Genre(
      id: entity.id,
      name: entity.name,
    );
  }

  GenreEntity toGenreEntity() {
    return GenreEntity(id, name);
  }

  final int id;
  final String name;

  @override
  List<Object?> get props => [id, name];
}
