import 'dart:math';

import 'package:movie_repository/movie_repository.dart';

class MovieRepositoryMock implements MovieRepository {
  const MovieRepositoryMock();

  @override
  Stream<List<Movie>> getComingSoonMovies() async* {
    const theNorthman = Movie(
      id: 1,
      imagePath:
          'https://image.tmdb.org/t/p/original/cqnVuxXe6vA7wfNWubak3x36DKJ.jpg',
      title: 'The Northman',
      isAdult: false,
      votesAverage: 8.5,
      genres: [],
    );
    const doctorStrange = Movie(
      id: 2,
      imagePath:
          'https://image.tmdb.org/t/p/original/wRnbWt44nKjsFPrqSmwYki5vZtF.jpg',
      title: 'Doctor Strange in the Multiverse of Madness',
      isAdult: false,
      votesAverage: 0,
      genres: [],
    );

    // yield* Future<List<Movie>>.delayed(
    //   const Duration(seconds: 1),
    //   // () => [],
    // ).asStream();

    yield* Future<List<Movie>>.delayed(
      const Duration(seconds: 1),
      () => [theNorthman],
    ).asStream();

    yield* Future<List<Movie>>.delayed(
      const Duration(seconds: 5),
      () => [theNorthman, doctorStrange],
    ).asStream();
  }

  ///
  @override
  Stream<List<Movie>> getTrendingNowMovies() async* {}

  ///
  @override
  Future<void> addFavorite(int movieId) async {}

  ///
  @override
  Future<void> removeFavorite(int movieId) async {}

  ///
  @override
  Stream<List<Movie>> getFavoriteMovies() async* {}

  ///
  @override
  Future<bool> isFavoriteMovie(int movieId) async {
    return Future.delayed(
      const Duration(seconds: 1),
      () => Random.secure().nextBool(),
    );
  }

  ///
  @override
  Future<MovieDetails> movieDetails(int movieId) async {
    const data = MovieDetails(
      id: 1,
      imagePath:
          'https://image.tmdb.org/t/p/original/zhLKlUaF1SEpO58ppHIAyENkwgw.jpg',
      title: 'The Northman',
      isAdult: false,
      votesAverage: 8.1,
      genres: [],
      description:
          "Prince Amleth is on the verge of becoming a man when his father is brutally murdered by his uncle, who kidnaps the boy's mother. Two decades later, Amleth is now a Viking who's on a mission to save his mother, kill his uncle and avenge his father.",
      language: 'en',
      duration: Duration(hours: 2, minutes: 15),
    );

    return Future.delayed(
      const Duration(seconds: 1),
      () => data,
    );
  }
}