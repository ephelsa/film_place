part of 'favorite_button_bloc.dart';

enum FavoriteButtonStatus { initial, loading, success, failure }

class FavoriteButtonState extends Equatable {
  const FavoriteButtonState(
    this.movieId, {
    this.status = FavoriteButtonStatus.initial,
    this.isFavorite = false,
  });

  final int movieId;
  final FavoriteButtonStatus status;
  final bool isFavorite;

  FavoriteButtonState copyWith({
    int? movieId,
    FavoriteButtonStatus? status,
    bool? isFavorite,
  }) {
    return FavoriteButtonState(
      movieId ?? this.movieId,
      status: status ?? this.status,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object> get props => [status, movieId, isFavorite];
}
