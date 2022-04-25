import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:genre_repository/genre_repository.dart';
import 'package:movie_repository/movie_repository.dart';

part 'coming_soon_event.dart';
part 'coming_soon_state.dart';

class ComingSoonBloc extends Bloc<ComingSoonEvent, ComingSoonState> {
  ComingSoonBloc({
    required MovieRepository movieRepository,
  })  : _movieRepository = movieRepository,
        super(const ComingSoonState()) {
    on<ComingSoonSubscriptionRequested>(_onSubscriptionRequested);
    on<ComingSoonRetryRequested>(_onRetryRequested);
    on<ComingSoonPlayRequested>(_onPlayRequested);
    on<ComingSoonPauseRequested>(_onPauseRequested);
    on<ComingSoonFilterChanged>(_onFilterChanged);
  }

  final MovieRepository _movieRepository;

  Future<void> _onSubscriptionRequested(
    ComingSoonSubscriptionRequested event,
    Emitter<ComingSoonState> emit,
  ) async {
    emit(state.copyWith(status: ComingSoonStatus.loading));

    await emit.forEach<List<Movie>>(
      _movieRepository.getComingSoonMovies(),
      onData: (movies) => state.copyWith(
        status: ComingSoonStatus.success,
        movies: movies,
      ),
      onError: (_, __) => state.copyWith(status: ComingSoonStatus.failure),
    );
  }

  Future<void> _onRetryRequested(
    ComingSoonRetryRequested event,
    Emitter<ComingSoonState> emit,
  ) async {
    emit(state.copyWith(status: ComingSoonStatus.loading));

    await emit.forEach<List<Movie>>(
      _movieRepository.getComingSoonMovies(),
      onData: (movies) => state.copyWith(
        status: ComingSoonStatus.success,
        movies: movies,
      ),
      onError: (_, __) => state.copyWith(status: ComingSoonStatus.failure),
    );
  }

  FutureOr<void> _onPlayRequested(
    ComingSoonPlayRequested event,
    Emitter<ComingSoonState> emit,
  ) {
    emit(
      state.copyWith(
        currentMovieReproduced: event.movie,
        isPlayingMovie: true,
      ),
    );
  }

  FutureOr<void> _onPauseRequested(
    ComingSoonPauseRequested event,
    Emitter<ComingSoonState> emit,
  ) {
    emit(
      state.copyWith(
        isPlayingMovie: false,
      ),
    );
  }

  FutureOr<void> _onFilterChanged(
    ComingSoonFilterChanged event,
    Emitter<ComingSoonState> emit,
  ) {
    emit(state.copyWith(genreToFilter: () => event.genre));
  }
}
