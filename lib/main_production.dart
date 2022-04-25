import 'package:film_place/bootstrap.dart';
import 'package:flutter_services_binding/flutter_services_binding.dart';
import 'package:genre_repository/genre_repository.dart';
import 'package:movie_repository/movie_repository.dart';
import 'package:the_movie_db_api/the_movie_db_api.dart';

void main() {
  FlutterServicesBinding.ensureInitialized();

  final httpClient = TMDBClient.client(
    'en-US',
    'YOUR-API-KEY-HERE',
  );

  // APIs
  final genreApi = GenreApi(httpClient);
  final movieApi = MovieApi(httpClient);

  // Repositories
  final genreRepository = GenreRepository(genreApi: genreApi);
  final movieRepository = MovieRepository(
    movieApi: movieApi,
    genreRepository: genreRepository,
  );

  bootstrap(
    movieRepository: movieRepository,
    genreRepository: genreRepository,
  );
}
