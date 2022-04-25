import 'package:genre_repository/genre_repository.dart';
import 'package:movie_repository/src/models/models.dart';
import 'package:rxdart/rxdart.dart';
import 'package:the_movie_db_api/the_movie_db_api.dart';

/// {@template movie_repository}
/// Dart package which manages the movie domain
/// {@endtemplate}
class MovieRepository {
  /// {@macro movie_repository}
  MovieRepository({
    required MovieApi movieApi,
    required GenreRepository genreRepository,
  })  : _movieApi = movieApi,
        _genreRepository = genreRepository;

  final MovieApi _movieApi;
  final GenreRepository _genreRepository;

  final _comingSoonStreamController =
      BehaviorSubject<List<Movie>>.seeded(const []);
  final _trendingNowStreamController =
      BehaviorSubject<List<Movie>>.seeded(const []);

  ///
  Stream<List<Movie>> getComingSoonMovies() async* {
    final response = await _movieApi.fetchComingSoonMovies();

    for (final remote in response?.results ?? <MovieRemote>[]) {
      final genres =
          await _genreRepository.getMovieGenresByIds(remote.genreIds);
      final movie = Movie.fromMovieRemote(remote, genres);

      _comingSoonStreamController.add([
        ..._comingSoonStreamController.value,
        movie,
      ]);
    }

    yield* _comingSoonStreamController.asBroadcastStream();
  }

  ///
  Stream<List<Movie>> getTrendingNowMovies() async* {
    final response = await _movieApi.fetchTrendingNowMovies();

    for (final remote in response?.results ?? <MovieRemote>[]) {
      final genres =
          await _genreRepository.getMovieGenresByIds(remote.genreIds);
      final movie = Movie.fromMovieRemote(remote, genres);

      _trendingNowStreamController.add([
        ..._trendingNowStreamController.value,
        movie,
      ]);
    }

    yield* _trendingNowStreamController.asBroadcastStream();
  }

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
