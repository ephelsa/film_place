import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_movie_db_api/src/models/genre_remote.dart';

part 'genre_list_remote.freezed.dart';
part 'genre_list_remote.g.dart';

@freezed
class GenreListRemote with _$GenreListRemote {
  const factory GenreListRemote({required List<GenreRemote> genres}) =
      _GenreListRemote;

  factory GenreListRemote.fromJson(Map<String, Object?> json) =>
      _$GenreListRemoteFromJson(json);
}
