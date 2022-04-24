import 'package:actor_repository/src/models/actor.dart';
import 'package:the_movie_db_api/the_movie_db_api.dart';

/// {@template actor_repository}
/// Dart package which manages the actor domain
/// {@endtemplate}
class ActorRepository {
  /// {@macro actor_repository}
  const ActorRepository({
    required ActorApi actorApi,
  }) : _actorApi = actorApi;

  final ActorApi _actorApi;

  Future<List<Actor>> getCastingByMovie(int movieId) async {
    final actors = await _actorApi.castingByMovie(movieId);

    return actors?.cast.map(Actor.fromActorRemote).toList() ?? [];
  }
}
