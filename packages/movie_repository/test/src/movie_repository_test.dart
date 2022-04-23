// ignore_for_file: prefer_const_constructors
import 'package:movie_repository/movie_repository.dart';
import 'package:test/test.dart';

void main() {
  group('MovieRepository', () {
    test('can be instantiated', () {
      expect(MovieRepository(), isNotNull);
    });
  });
}
