part of 'favorites_bloc.dart';

enum FavoritesStatus { initial, loading, success, failure }

class FavoritesState extends Equatable {
  const FavoritesState({
    this.status = FavoritesStatus.initial,
    this.movies,
  });

  final FavoritesStatus status;
  final List<MovieDetails>? movies;

  FavoritesState copyWith({
    FavoritesStatus? status,
    List<MovieDetails>? movies,
  }) {
    return FavoritesState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
    );
  }

  @override
  List<Object?> get props => [status, movies];
}
