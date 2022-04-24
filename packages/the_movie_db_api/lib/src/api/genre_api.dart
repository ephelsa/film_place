import 'package:dio/dio.dart';
import 'package:the_movie_db_api/src/models/models.dart';

class GenreApi {
  const GenreApi(Dio client) : _client = client;

  final Dio _client;

  Future<GenreListRemote?> getMovieGenres() async {
    try {
      final response =
          await _client.get<Map<String, Object?>>('/genre/movie/list');

      return GenreListRemote.fromJson(response.data!);
    } catch (_) {
      throw TMDBException();
    }
  }
}
