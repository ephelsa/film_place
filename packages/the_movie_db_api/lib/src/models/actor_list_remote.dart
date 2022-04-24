import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_movie_db_api/src/models/actor_remote.dart';

part 'actor_list_remote.freezed.dart';
part 'actor_list_remote.g.dart';

@freezed
class ActorListRemote with _$ActorListRemote {
  const factory ActorListRemote({required List<ActorRemote> cast}) =
      _ActorListRemote;

  factory ActorListRemote.fromJson(Map<String, Object?> json) =>
      _$ActorListRemoteFromJson(json);
}
