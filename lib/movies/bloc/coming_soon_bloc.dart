import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
  }

  final MovieRepository _movieRepository;

  Future<void> _onSubscriptionRequested(
    ComingSoonSubscriptionRequested event,
    Emitter<ComingSoonState> emit,
  ) async {
    emit(state.copyWidth(status: ComingSoonStatus.loading));

    await emit.forEach<List<Movie>>(
      _movieRepository.getComingSoonMovies(),
      onData: (movies) => state.copyWidth(
        status: ComingSoonStatus.success,
        movies: movies,
      ),
      onError: (_, __) => state.copyWidth(status: ComingSoonStatus.failure),
    );
  }

  Future<void> _onRetryRequested(
    ComingSoonRetryRequested event,
    Emitter<ComingSoonState> emit,
  ) async {
    emit(state.copyWidth(status: ComingSoonStatus.loading));

    await emit.forEach<List<Movie>>(
      _movieRepository.getComingSoonMovies(),
      onData: (movies) => state.copyWidth(
        status: ComingSoonStatus.success,
        movies: movies,
      ),
      onError: (_, __) => state.copyWidth(status: ComingSoonStatus.failure),
    );
  }

  FutureOr<void> _onPlayRequested(
    ComingSoonPlayRequested event,
    Emitter<ComingSoonState> emit,
  ) {
    emit(
      state.copyWidth(
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
      state.copyWidth(
        isPlayingMovie: false,
      ),
    );
  }
}
