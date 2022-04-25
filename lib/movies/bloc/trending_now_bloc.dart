import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:genre_repository/genre_repository.dart';
import 'package:movie_repository/movie_repository.dart';

part 'trending_now_event.dart';
part 'trending_now_state.dart';

class TrendingNowBloc extends Bloc<TrendingNowEvent, TrendingNowState> {
  TrendingNowBloc({
    required MovieRepository movieRepository,
  })  : _movieRepository = movieRepository,
        super(const TrendingNowState()) {
    on<TrendingNowSubscriptionRequested>(_onSubscriptionRequested);
    on<TrendingNowFilterChanged>(_onFilterChanged);
  }

  final MovieRepository _movieRepository;

  FutureOr<void> _onSubscriptionRequested(
    TrendingNowSubscriptionRequested event,
    Emitter<TrendingNowState> emit,
  ) async {
    emit(state.copyWith(status: TrendingNowStatus.loading));

    await emit.forEach<List<Movie>>(
      _movieRepository.getTrendingNowMovies(),
      onData: (movies) => state.copyWith(
        status: TrendingNowStatus.success,
        movies: movies,
      ),
      onError: (_, __) => state.copyWith(status: TrendingNowStatus.failure),
    );
  }

  FutureOr<void> _onFilterChanged(
    TrendingNowFilterChanged event,
    Emitter<TrendingNowState> emit,
  ) {
    emit(state.copyWith(genreToFilter: () => event.genre));
  }
}
