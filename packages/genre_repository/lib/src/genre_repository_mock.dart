import 'package:genre_repository/genre_repository.dart';

class GenreRepositoryMock implements GenreRepository {
  const GenreRepositoryMock();

  List<Genre> get _genres => const <Genre>[
        Genre(id: 1, name: 'Action'),
        Genre(id: 2, name: 'Comedy'),
        Genre(id: 3, name: 'Romance'),
        Genre(id: 4, name: 'Fantasy'),
        Genre(id: 5, name: 'Drama'),
        Genre(id: 6, name: 'Documental'),
        Genre(id: 7, name: 'Horror'),
        Genre(id: 8, name: 'Suspense'),
      ];

  @override
  Future<List<Genre>> getAllMovieGenres() {
    return Future.delayed(
      const Duration(seconds: 1),
      () => _genres,
    );
  }

  @override
  Future<List<Genre>> getMovieGenresByIds(List<int> ids) {
    return Future.delayed(
      const Duration(seconds: 1),
      () => ids
          .map((id) => _genres.firstWhere((genre) => genre.id == id))
          .toList(),
    );
  }

  @override
  Future<List<Genre>> refreshMovieGenres() {
    return Future.delayed(
      const Duration(seconds: 1),
      () => _genres,
    );
  }
}
