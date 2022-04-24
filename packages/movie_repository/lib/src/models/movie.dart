import 'package:equatable/equatable.dart';
import 'package:genre_repository/genre_repository.dart';

class Movie extends Equatable {
  const Movie({
    required this.id,
    required this.imagePath,
    required this.title,
    required this.isAdult,
    required this.votesAverage,
    required this.genres,
  });

  final int id;
  final String imagePath;
  final String title;
  final bool isAdult;
  final double votesAverage;
  final List<Genre> genres;

  @override
  List<Object?> get props => [
        id,
        imagePath,
        title,
        isAdult,
        votesAverage,
        genres,
      ];
}
