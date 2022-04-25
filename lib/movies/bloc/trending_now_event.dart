part of 'trending_now_bloc.dart';

abstract class TrendingNowEvent extends Equatable {
  const TrendingNowEvent();

  @override
  List<Object?> get props => [];
}

class TrendingNowSubscriptionRequested extends TrendingNowEvent {
  const TrendingNowSubscriptionRequested();
}

class TrendingNowFilterChanged extends TrendingNowEvent {
  const TrendingNowFilterChanged(this.genre);

  final Genre? genre;

  @override
  List<Object?> get props => [genre];
}
