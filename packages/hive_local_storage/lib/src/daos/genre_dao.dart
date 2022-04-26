import 'package:hive_local_storage/src/config.dart';
import 'package:hive_local_storage/src/entities/entities.dart';

class GenreDao {
  const GenreDao();

  Future<void> refreshMovieGenres(List<GenreEntity> genres) async {
    final box = await OpenBox.genres();

    await box.clear();
    await box.addAll(genres);
  }

  Future<bool> isMovieGenresEmpty() async {
    final box = await OpenBox.genres();

    return box.values.isEmpty;
  }

  Future<List<GenreEntity>> fetchAllMoviesGenres() async {
    final box = await OpenBox.genres();

    return box.values.toList();
  }
}
