import 'package:equatable/equatable.dart';
import 'package:genre_repository/genre_repository.dart';
import 'package:the_movie_db_api/the_movie_db_api.dart';

class Movie extends Equatable {
  const Movie({
    required this.id,
    required this.imagePath,
    required this.title,
    required this.isAdult,
    required this.votesAverage,
    required this.genres,
  });

  /// Movie mapper from [MovieRemote]
  factory Movie.fromMovieRemote(MovieRemote remote, List<Genre> genres) {
    return Movie(
      id: remote.id,
      imagePath: remote.backdropPath,
      title: remote.title,
      isAdult: remote.isAdult,
      votesAverage: remote.voteAverage,
      genres: genres,
    );
  }

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
