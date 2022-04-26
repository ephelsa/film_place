import 'package:film_place/bootstrap.dart';
import 'package:flutter_services_binding/flutter_services_binding.dart';
import 'package:genre_repository/genre_repository.dart';
import 'package:hive_local_storage/hive_local_storage.dart';
import 'package:movie_repository/movie_repository.dart';

Future<void> main() async {
  FlutterServicesBinding.ensureInitialized();

  await HiveLocalStorage.initialize();

  await bootstrap(
    movieRepository: const MovieRepositoryMock(),
    genreRepository: const GenreRepositoryMock(),
  );
}
