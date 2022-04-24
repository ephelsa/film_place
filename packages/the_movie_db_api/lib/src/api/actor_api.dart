import 'package:dio/dio.dart';
import 'package:the_movie_db_api/src/api/image_provider.dart';
import 'package:the_movie_db_api/src/models/models.dart';

class ActorApi {
  const ActorApi(Dio client) : _client = client;

  final Dio _client;

  Future<ActorListRemote?> castingByMovie(int movieId) async {
    try {
      final response =
          await _client.get<Map<String, Object?>>('/movie/$movieId/credits');

      final list = ActorListRemote.fromJson(response.data!);

      return list.copyWith(
        cast: list.cast
            .map(
              (actorRemote) => actorRemote.copyWith(
                profilePath: ImageProvider(actorRemote.profilePath).fullPath,
              ),
            )
            .toList(),
      );
    } catch (_) {
      throw TMDBException();
    }
  }
}
