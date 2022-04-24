import 'package:freezed_annotation/freezed_annotation.dart';

part 'actor_remote.freezed.dart';
part 'actor_remote.g.dart';

@freezed
class ActorRemote with _$ActorRemote {
  const factory ActorRemote({
    required int id,
    required String name,
    @JsonKey(name: 'profile_path') required String profilePath,
  }) = _ActorRemote;

  factory ActorRemote.fromJson(Map<String, Object?> json) =>
      _$ActorRemoteFromJson(json);
}
