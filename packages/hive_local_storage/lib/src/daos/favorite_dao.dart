import 'package:hive_local_storage/src/config.dart';
import 'package:rxdart/rxdart.dart';

class FavoriteDao {
  FavoriteDao();

  final _favoriteMoviesStreamController =
      BehaviorSubject<List<int>>.seeded(const [])
        ..addStream(_initFavoriteMoviesFetched());

  static Stream<List<int>> _initFavoriteMoviesFetched() async* {
    final box = await OpenBox.favoriteMovies();

    yield* Stream.value(box.values.toList());
  }

  Future<void> addFavoriteMovieId(int id) async {
    final box = await OpenBox.favoriteMovies();

    if (box.get(id) != null) {
      throw MovieAlreadyInFavorites();
    }

    await box.put(id, id);
    _favoriteMoviesStreamController.add(box.values.toList());
  }

  Future<void> removeFavoriteMovieId(int id) async {
    final box = await OpenBox.favoriteMovies();

    if (box.get(id) == null) {
      throw MovieNotInFavorites();
    }

    await box.delete(id);
    _favoriteMoviesStreamController.add(box.values.toList());
  }

  Stream<List<int>> fetchFavoriteMovies() =>
      _favoriteMoviesStreamController.asBroadcastStream();
}

class MovieAlreadyInFavorites implements Exception {}

class MovieNotInFavorites implements Exception {}
