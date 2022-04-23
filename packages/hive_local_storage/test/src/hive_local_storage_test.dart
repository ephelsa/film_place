// ignore_for_file: prefer_const_constructors
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_local_storage/hive_local_storage.dart';

void main() {
  group('HiveLocalStorage', () {
    test('can be instantiated', () {
      expect(HiveLocalStorage(), isNotNull);
    });
  });
}
