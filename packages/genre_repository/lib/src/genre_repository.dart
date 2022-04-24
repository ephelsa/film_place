import 'package:genre_repository/src/models/genre.dart';
import 'package:the_movie_db_api/the_movie_db_api.dart';

/// {@template genre_repository}
/// Dart package which manages the genre domain
/// {@endtemplate}
class GenreRepository {
  /// {@macro genre_repository}
  const GenreRepository({
    required GenreApi genreApi,
  }) : _genreApi = genreApi;

  final GenreApi _genreApi;

  Future<List<Genre>> refreshMovieGenres() async {
    final remoteResult = await _genreApi.getMovieGenres();
    // TODO(ephelsa): Store the data locally

    return remoteResult?.genres.map(Genre.fromGenreRemote).toList() ?? [];
  }

  Future<List<Genre>> getMovieGenresByIds(List<int> ids) async {
    // TODO(ephelsa): Check local storage and return
    final genres = await refreshMovieGenres();

    return ids
        .map((id) => genres.firstWhere((genre) => genre.id == id))
        .toList();
  }

  Future<List<Genre>> getAllMovieGenres() async {
    // TODO(ephelsa): Check local storage and return
    return refreshMovieGenres();
  }
}
