part of 'genres_bloc.dart';

abstract class GenresEvent extends Equatable {
  const GenresEvent();

  @override
  List<Object> get props => [];
}

class GenresSubscriptionRequested extends GenresEvent {
  const GenresSubscriptionRequested();
}

class GenresFilterChanged extends GenresEvent {
  const GenresFilterChanged(this.genre);

  final Genre genre;

  @override
  List<Object> get props => [genre];
}
