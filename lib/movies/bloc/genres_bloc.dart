import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:genre_repository/genre_repository.dart';

part 'genres_event.dart';
part 'genres_state.dart';

class GenresBloc extends Bloc<GenresEvent, GenresState> {
  GenresBloc({
    required GenreRepository genreRepository,
  })  : _genreRepository = genreRepository,
        super(const GenresState()) {
    on<GenresSubscriptionRequested>(_onSubscriptionRequested);
    on<GenresFilterChanged>(_onFilterChanged);
  }

  final GenreRepository _genreRepository;

  FutureOr<void> _onSubscriptionRequested(
    GenresSubscriptionRequested event,
    Emitter<GenresState> emit,
  ) async {
    emit(state.copyWith(status: GenresStatus.loading));

    await emit.forEach<List<Genre>>(
      _genreRepository.getAllMovieGenres().asStream(),
      onData: (genres) => state.copyWith(
        status: GenresStatus.success,
        genres: genres,
      ),
      onError: (_, __) => state.copyWith(status: GenresStatus.failure),
    );
  }

  FutureOr<void> _onFilterChanged(
    GenresFilterChanged event,
    Emitter<GenresState> emit,
  ) {
    emit(
      state.copyWith(
        selectedGenre: () => state.isSelected(event.genre) ? null : event.genre,
      ),
    );
  }
}
