import 'package:film_place/bootstrap.dart';
import 'package:flutter_services_binding/flutter_services_binding.dart';
import 'package:genre_repository/genre_repository.dart';
import 'package:hive_local_storage/hive_local_storage.dart';
import 'package:movie_repository/movie_repository.dart';
import 'package:the_movie_db_api/the_movie_db_api.dart';

Future<void> main() async {
  FlutterServicesBinding.ensureInitialized();

  // Database
  await HiveLocalStorage.initialize();

  // Daos
  const genreDao = GenreDao();
  final favoriteDao = FavoriteDao();

  // Http client
  final httpClient = TMDBClient.client(
    'en-US',
    'YOUR-API-KEY-HERE',
  );

  // APIs
  final genreApi = GenreApi(httpClient);
  final movieApi = MovieApi(httpClient);

  // Repositories
  final genreRepository = GenreRepository(
    genreApi: genreApi,
    genreDao: genreDao,
  );
  final movieRepository = MovieRepository(
    movieApi: movieApi,
    genreRepository: genreRepository,
    favoriteDao: favoriteDao,
  );

  await bootstrap(
    movieRepository: movieRepository,
    genreRepository: genreRepository,
  );
}
