import 'package:equatable/equatable.dart';
import 'package:genre_repository/genre_repository.dart';
import 'package:the_movie_db_api/the_movie_db_api.dart';

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

  factory MovieDetails.fromMovieDetailsRemote(MovieDetailsRemote remote) {
    return MovieDetails(
      id: remote.id,
      imagePath: remote.posterPath,
      title: remote.title,
      isAdult: remote.isAdult,
      votesAverage: remote.voteAverage,
      genres: remote.genres.map(Genre.fromGenreRemote).toList(),
      description: remote.description,
      language: remote.language,
      duration: Duration.zero,
    );
  }

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
