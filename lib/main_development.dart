import 'package:film_place/bootstrap.dart';
import 'package:flutter_services_binding/flutter_services_binding.dart';
import 'package:genre_repository/genre_repository.dart';
import 'package:movie_repository/movie_repository.dart';

void main() {
  FlutterServicesBinding.ensureInitialized();

  bootstrap(
    movieRepository: const MovieRepositoryMock(),
    genreRepository: const GenreRepositoryMock(),
  );
}
