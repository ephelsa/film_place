import 'package:equatable/equatable.dart';
import 'package:genre_repository/genre_repository.dart';

class MovieDetails extends Equatable {
  const MovieDetails({
    required this.id,
    required this.imagePath,
    required this.title,
    required this.isAdult,
    required this.votesAverage,
    required this.genres,
    required this.description,
    required this.language,
    required this.duration,
  });

  final int id;
  final String imagePath;
  final String title;
  final bool isAdult;
  final double votesAverage;
  final List<Genre> genres;
  final String description;
  final String language;
  final Duration duration;

  @override
  List<Object?> get props => [
        id,
        imagePath,
        title,
        isAdult,
        votesAverage,
        genres,
        description,
        language,
        duration,
      ];
}
