part of 'trending_now_bloc.dart';

enum TrendingNowStatus { initial, loading, success, failure }

class TrendingNowState extends Equatable {
  const TrendingNowState({
    this.status = TrendingNowStatus.initial,
    this.movies,
    this.genreToFilter,
  });

  final TrendingNowStatus status;
  final List<Movie>? movies;
  final Genre? genreToFilter;

  List<Movie>? moviesFiltered() {
    if (genreToFilter != null) {
      return movies
          ?.where((movie) => movie.genres.contains(genreToFilter))
          .toList();
    }

    return movies;
  }

  TrendingNowState copyWith({
    TrendingNowStatus? status,
    List<Movie>? movies,
    Genre? Function()? genreToFilter,
  }) {
    return TrendingNowState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
      genreToFilter:
          genreToFilter != null ? genreToFilter() : this.genreToFilter,
    );
  }

  @override
  List<Object?> get props => [
        status,
        movies,
        genreToFilter,
      ];
}
