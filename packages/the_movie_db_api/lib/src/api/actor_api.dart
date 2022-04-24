import 'package:dio/dio.dart';
import 'package:the_movie_db_api/src/models/models.dart';

class ActorApi {
  const ActorApi(Dio client) : _client = client;

  final Dio _client;

  Future<ActorListRemote?> castingByMovie(int movieId) async {
    try {
      final response =
          await _client.get<Map<String, Object?>>('/movie/$movieId/credits');

      return ActorListRemote.fromJson(response.data!);
    } catch (_) {
      throw TMDBException();
    }
  }
}
