part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

class FavoritesSubscriptionRequested extends FavoritesEvent {
  const FavoritesSubscriptionRequested();
}

class FavoritesRemoved extends FavoritesEvent {
  const FavoritesRemoved(this.movieId);

  final int movieId;

  @override
  List<Object> get props => [movieId];
}
