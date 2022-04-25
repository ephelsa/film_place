part of 'coming_soon_bloc.dart';

enum ComingSoonStatus { initial, loading, success, failure }

class ComingSoonState extends Equatable {
  const ComingSoonState({
    this.status = ComingSoonStatus.initial,
    this.movies,
    this.isPlayingMovie = false,
    this.currentMovieReproduced,
    this.genreToFilter,
  });

  final ComingSoonStatus status;
  final List<Movie>? movies;
  final bool isPlayingMovie;
  final Movie? currentMovieReproduced;
  final Genre? genreToFilter;

  List<Movie>? moviesFiltered() {
    if (genreToFilter != null) {
      return movies
          ?.where((movie) => movie.genres.contains(genreToFilter))
          .toList();
    }

    return movies;
  }

  ComingSoonState copyWith({
    ComingSoonStatus? status,
    List<Movie>? movies,
    bool? isPlayingMovie,
    Movie? currentMovieReproduced,
    Genre? Function()? genreToFilter,
  }) {
    return ComingSoonState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
      isPlayingMovie: isPlayingMovie ?? this.isPlayingMovie,
      currentMovieReproduced:
          currentMovieReproduced ?? this.currentMovieReproduced,
      genreToFilter:
          genreToFilter != null ? genreToFilter() : this.genreToFilter,
    );
  }

  @override
  List<Object?> get props => [
        status,
        movies,
        isPlayingMovie,
        currentMovieReproduced,
        genreToFilter,
      ];
}
