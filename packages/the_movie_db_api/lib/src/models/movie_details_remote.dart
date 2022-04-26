import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_movie_db_api/the_movie_db_api.dart';

part 'movie_details_remote.freezed.dart';
part 'movie_details_remote.g.dart';

@freezed
class MovieDetailsRemote with _$MovieDetailsRemote {
  const factory MovieDetailsRemote({
    required int id,
    @JsonKey(name: 'poster_path') required String posterPath,
    required String title,
    @JsonKey(name: 'adult') required bool isAdult,
    @JsonKey(name: 'vote_average') required double voteAverage,
    required List<GenreRemote> genres,
    @JsonKey(name: 'overview') required String description,
    @JsonKey(name: 'original_language') required String language,
    @JsonKey(name: 'runtime') required int duration,
  }) = _MovieDetailsRemote;

  factory MovieDetailsRemote.fromJson(Map<String, Object?> json) =>
      _$MovieDetailsRemoteFromJson(json);
}
