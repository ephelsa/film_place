import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_repository/movie_repository.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc({
    required MovieRepository movieRepository,
  })  : _movieRepository = movieRepository,
        super(const FavoritesState()) {
    on<FavoritesSubscriptionRequested>(_onSubscriptionRequested);
    on<FavoritesRemoved>(_onRemoved);
  }

  final MovieRepository _movieRepository;

  FutureOr<void> _onSubscriptionRequested(
    FavoritesSubscriptionRequested event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(state.copyWith(status: FavoritesStatus.loading));

    await emit.forEach<List<MovieDetails>>(
      _movieRepository.getFavoriteMovies(),
      onData: (movies) => state.copyWith(
        status: FavoritesStatus.success,
        movies: movies,
      ),
      onError: (_, __) => state.copyWith(status: FavoritesStatus.failure),
    );
  }

  FutureOr<void> _onRemoved(
    FavoritesRemoved event,
    Emitter<FavoritesState> emit,
  ) async {
    await _movieRepository.removeFavorite(event.movieId).onError(
          (_, __) => state.copyWith(status: FavoritesStatus.failure),
        );
  }
}
