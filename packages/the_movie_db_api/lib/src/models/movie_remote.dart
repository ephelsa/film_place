import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_remote.freezed.dart';
part 'movie_remote.g.dart';

@freezed
class MovieRemote with _$MovieRemote {
  const factory MovieRemote({
    required int id,
    @JsonKey(name: 'backdrop_path') required String backdropPath,
    @JsonKey(name: 'poster_path') required String posterPath,
    @JsonKey(name: 'original_title') required String title,
    @JsonKey(name: 'adult') required bool isAdult,
    @JsonKey(name: 'vote_average') required double voteAverage,
    @JsonKey(name: 'genre_ids') required List<int> genreIds,
  }) = _MovieRemote;

  factory MovieRemote.fromJson(Map<String, Object?> json) =>
      _$MovieRemoteFromJson(json);
}
