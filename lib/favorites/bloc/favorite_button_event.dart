part of 'favorite_button_bloc.dart';

abstract class FavoriteButtonEvent extends Equatable {
  const FavoriteButtonEvent();

  @override
  List<Object?> get props => [];
}

class FavoriteButtonSubscriptionRequested extends FavoriteButtonEvent {
  const FavoriteButtonSubscriptionRequested();
}

class FavoriteButtonAdded extends FavoriteButtonEvent {
  const FavoriteButtonAdded();
}

class FavoriteButtonRemoved extends FavoriteButtonEvent {
  const FavoriteButtonRemoved();
}
