import 'package:genre_repository/genre_repository.dart';
import 'package:hive_local_storage/hive_local_storage.dart';
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
    required FavoriteDao favoriteDao,
  })  : _movieApi = movieApi,
        _genreRepository = genreRepository,
        _favoriteDao = favoriteDao;

  final MovieApi _movieApi;
  final GenreRepository _genreRepository;
  final FavoriteDao _favoriteDao;

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
  Future<void> addFavorite(int movieId) =>
      _favoriteDao.addFavoriteMovieId(movieId);

  ///
  Future<void> removeFavorite(int movieId) =>
      _favoriteDao.removeFavoriteMovieId(movieId);

  ///
  Stream<List<MovieDetails>> getFavoriteMovies() {
    return _favoriteDao
        .fetchFavoriteMovies()
        .asyncMap<List<MovieDetails>>(_fetchMovieDetailsByIds)
        .asBroadcastStream();
  }

  Future<List<MovieDetails>> _fetchMovieDetailsByIds(List<int> ids) {
    final result = ids.map(
      (id) async =>
          MovieDetails.fromMovieDetailsRemote(await _movieApi.getDetails(id)),
    );

    return Stream.fromFutures(result).toList();
  }

  ///
  Stream<bool> isFavoriteMovie(int movieId) {
    return _favoriteDao
        .fetchFavoriteMovies()
        .map((event) => event.contains(movieId));
  }

  ///
  Future<MovieDetails> movieDetails(int movieId) async {
    final response = await _movieApi.getDetails(movieId);

    return MovieDetails.fromMovieDetailsRemote(response);
  }
}
