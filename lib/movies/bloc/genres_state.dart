part of 'genres_bloc.dart';

enum GenresStatus { initial, loading, success, failure }

class GenresState extends Equatable {
  const GenresState({
    this.status = GenresStatus.initial,
    this.genres,
    this.selectedGenre,
  });

  final GenresStatus status;
  final List<Genre>? genres;
  final Genre? selectedGenre;

  GenresState copyWith({
    GenresStatus? status,
    List<Genre>? genres,
    Genre? Function()? selectedGenre,
  }) {
    return GenresState(
      status: status ?? this.status,
      genres: genres ?? this.genres,
      selectedGenre:
          selectedGenre != null ? selectedGenre() : this.selectedGenre,
    );
  }

  bool isSelected(Genre genre) {
    return selectedGenre == genre;
  }

  @override
  List<Object?> get props => [
        status,
        genres,
        selectedGenre,
      ];
}
