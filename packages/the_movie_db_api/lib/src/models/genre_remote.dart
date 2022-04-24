import 'package:freezed_annotation/freezed_annotation.dart';

part 'genre_remote.freezed.dart';
part 'genre_remote.g.dart';

@freezed
class GenreRemote with _$GenreRemote {
  const factory GenreRemote({
    required int id,
    required String name,
  }) = _GenreRemote;

  factory GenreRemote.fromJson(Map<String, Object?> json) =>
      _$GenreRemoteFromJson(json);
}
