// ignore_for_file: cast_nullable_to_non_nullable

import 'package:dio/dio.dart';
import 'package:the_movie_db_api/src/api/image_provider.dart';
import 'package:the_movie_db_api/src/models/models.dart';

class MovieApi {
  const MovieApi(Dio client) : _client = client;

  final Dio _client;

  Future<ResultsRemote<MovieRemote>?> fetchComingSoonMovies() async {
    try {
      final response =
          await _client.get<Map<String, Object?>>('/movie/upcoming');

      return ResultsRemote.fromJsom(
        response.data!,
        (json) {
          final movie = MovieRemote.fromJson(json as Map<String, Object?>);

          return movie.copyWith(
            backdropPath: ImageProvider(movie.backdropPath).fullPath,
          );
        },
      );
    } catch (_) {
      throw TMDBException();
    }
  }

  Future<ResultsRemote<MovieRemote>?> fetchTrendingNowMovies() async {
    try {
      final response =
          await _client.get<Map<String, Object?>>('/trending/movie/day');

      return ResultsRemote.fromJsom(
        response.data!,
        (json) {
          final movie = MovieRemote.fromJson(json as Map<String, Object?>);

          return movie.copyWith(
            backdropPath: ImageProvider(movie.backdropPath).fullPath,
          );
        },
      );
    } catch (_) {
      throw TMDBException();
    }
  }
}
