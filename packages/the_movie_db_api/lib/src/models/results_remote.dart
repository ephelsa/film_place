import 'package:freezed_annotation/freezed_annotation.dart';

part 'results_remote.freezed.dart';
part 'results_remote.g.dart';

@freezed
@JsonSerializable(genericArgumentFactories: true)
class ResultsRemote<T> with _$ResultsRemote<T> {
  const factory ResultsRemote({
    required List<T> results,
  }) = _ResultsRemote;

  factory ResultsRemote.fromJsom(
    Map<String, Object?> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$ResultsRemoteFromJson(json, fromJsonT);
}
