import 'package:equatable/equatable.dart';
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

  final int id;
  final String name;

  @override
  List<Object?> get props => [id, name];
}
