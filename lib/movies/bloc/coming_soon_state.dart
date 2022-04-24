part of 'coming_soon_bloc.dart';

enum ComingSoonStatus { initial, loading, success, failure }

class ComingSoonState extends Equatable {
  const ComingSoonState({
    this.status = ComingSoonStatus.initial,
    this.movies,
    this.isPlayingMovie = false,
    this.currentMovieReproduced,
  });

  final ComingSoonStatus status;
  final List<Movie>? movies;
  final bool isPlayingMovie;
  final Movie? currentMovieReproduced;

  ComingSoonState copyWidth({
    ComingSoonStatus? status,
    List<Movie>? movies,
    bool? isPlayingMovie,
    Movie? currentMovieReproduced,
  }) {
    return ComingSoonState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
      isPlayingMovie: isPlayingMovie ?? this.isPlayingMovie,
      currentMovieReproduced:
          currentMovieReproduced ?? this.currentMovieReproduced,
    );
  }

  @override
  List<Object?> get props => [
        status,
        movies,
        isPlayingMovie,
        currentMovieReproduced,
      ];
}
