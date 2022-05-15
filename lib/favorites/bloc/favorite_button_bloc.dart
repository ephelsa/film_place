import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_repository/movie_repository.dart';

part 'favorite_button_event.dart';
part 'favorite_button_state.dart';

class FavoriteButtonBloc
    extends Bloc<FavoriteButtonEvent, FavoriteButtonState> {
  FavoriteButtonBloc(
    int movieId, {
    required MovieRepository movieRepository,
  })  : _movieRepository = movieRepository,
        super(FavoriteButtonState(movieId)) {
    on<FavoriteButtonSubscriptionRequested>(_onSubscriptionRequested);
    on<FavoriteButtonAdded>(_onAdded);
    on<FavoriteButtonRemoved>(_onRemoved);
  }

  final MovieRepository _movieRepository;

  FutureOr<void> _onSubscriptionRequested(
    FavoriteButtonSubscriptionRequested event,
    Emitter<FavoriteButtonState> emit,
  ) async {
    emit(state.copyWith(status: FavoriteButtonStatus.loading));

    await emit.forEach<bool>(
      _movieRepository.isFavoriteMovie(state.movieId),
      onData: (isFavorite) => state.copyWith(
        status: FavoriteButtonStatus.success,
        isFavorite: isFavorite,
      ),
      onError: (_, __) => state.copyWith(status: FavoriteButtonStatus.failure),
    );
  }

  FutureOr<void> _onRemoved(
    FavoriteButtonRemoved event,
    Emitter<FavoriteButtonState> emit,
  ) async {
    emit(state.copyWith(status: FavoriteButtonStatus.loading));

    await _movieRepository.removeFavorite(state.movieId).then((_) {
      emit(
        state.copyWith(
          status: FavoriteButtonStatus.success,
          isFavorite: false,
        ),
      );
    }).onError((_, __) {
      emit(state.copyWith(status: FavoriteButtonStatus.failure));
    });
  }

  FutureOr<void> _onAdded(
    FavoriteButtonAdded event,
    Emitter<FavoriteButtonState> emit,
  ) async {
    emit(state.copyWith(status: FavoriteButtonStatus.loading));

    await _movieRepository.addFavorite(state.movieId).then((_) {
      emit(
        state.copyWith(
          status: FavoriteButtonStatus.success,
          isFavorite: true,
        ),
      );
    }).onError((_, __) {
      emit(state.copyWith(status: FavoriteButtonStatus.failure));
    });
  }
}
