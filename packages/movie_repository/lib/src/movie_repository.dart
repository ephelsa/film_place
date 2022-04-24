import 'package:movie_repository/src/models/models.dart';

/// {@template movie_repository}
/// Dart package which manages the movie domain
/// {@endtemplate}
class MovieRepository {
  /// {@macro movie_repository}
  const MovieRepository();

  ///
  Stream<List<Movie>> getComingSoonMovies() async* {
    throw UnimplementedError();
  }

  ///
  Stream<List<Movie>> getTrendingNowMovies() async* {}

  ///
  Future<void> addFavorite(int movieId) async {}

  ///
  Future<void> removeFavorite(int movieId) async {}

  ///
  Stream<List<Movie>> getFavoriteMovies() async* {}

  ///
  Future<bool> isFavoriteMovie(int movieId) async {
    throw UnimplementedError();
  }

  ///
  Future<MovieDetails> movieDetails(int movieId) async {
    throw UnimplementedError();
  }
}
