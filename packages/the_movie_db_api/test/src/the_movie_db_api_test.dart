// ignore_for_file: prefer_const_constructors
import 'package:test/test.dart';
import 'package:the_movie_db_api/the_movie_db_api.dart';

void main() {
  group('TheMovieDbApi', () {
    test('can be instantiated', () {
      expect(TheMovieDbApi(), isNotNull);
    });
  });
}
