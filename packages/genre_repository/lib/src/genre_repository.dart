import 'package:genre_repository/src/models/genre.dart';
import 'package:hive_local_storage/hive_local_storage.dart';
import 'package:the_movie_db_api/the_movie_db_api.dart';

/// {@template genre_repository}
/// Dart package which manages the genre domain
/// {@endtemplate}
class GenreRepository {
  /// {@macro genre_repository}
  const GenreRepository({
    required GenreApi genreApi,
    required GenreDao genreDao,
  })  : _genreApi = genreApi,
        _genreDao = genreDao;

  final GenreApi _genreApi;
  final GenreDao _genreDao;

  Future<List<Genre>> refreshMovieGenres() async {
    final remoteResult = await _genreApi.getMovieGenres();
    final genres =
        remoteResult?.genres.map(Genre.fromGenreRemote).toList() ?? [];

    await _genreDao.refreshMovieGenres(
      genres.map((genre) => genre.toGenreEntity()).toList(),
    );

    return genres;
  }

  Future<List<Genre>> getMovieGenresByIds(List<int> ids) async {
    final genres = <Genre>[];

    if (await _genreDao.isMovieGenresEmpty()) {
      genres.addAll(await refreshMovieGenres());
    } else {
      final entities = await _genreDao.fetchAllMoviesGenres();

      genres.addAll(entities.map(Genre.fromGenreEntity).toList());
    }

    return ids
        .map((id) => genres.firstWhere((genre) => genre.id == id))
        .toList();
  }

  Future<List<Genre>> getAllMovieGenres() async {
    if (await _genreDao.isMovieGenresEmpty()) {
      return refreshMovieGenres();
    }

    final entities = await _genreDao.fetchAllMoviesGenres();

    return entities.map(Genre.fromGenreEntity).toList();
  }
}
