part of 'coming_soon_bloc.dart';

abstract class ComingSoonEvent extends Equatable {
  const ComingSoonEvent();

  @override
  List<Object?> get props => [];
}

class ComingSoonSubscriptionRequested extends ComingSoonEvent {
  const ComingSoonSubscriptionRequested();
}

class ComingSoonRetryRequested extends ComingSoonEvent {
  const ComingSoonRetryRequested();
}

class ComingSoonPlayRequested extends ComingSoonEvent {
  const ComingSoonPlayRequested(this.movie);

  final Movie movie;

  @override
  List<Object> get props => [movie];
}

class ComingSoonPauseRequested extends ComingSoonEvent {
  const ComingSoonPauseRequested();
}

class ComingSoonFilterChanged extends ComingSoonEvent {
  const ComingSoonFilterChanged(this.genre);

  final Genre? genre;

  @override
  List<Object?> get props => [genre];
}
