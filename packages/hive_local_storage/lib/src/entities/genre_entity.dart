import 'package:hive/hive.dart';
import 'package:hive_local_storage/src/config.dart';

part 'genre_entity.g.dart';

@HiveType(typeId: TypeId.genreTypeId)
class GenreEntity {
  GenreEntity(this.id, this.name);

  @HiveField(0)
  int id;

  @HiveField(1)
  String name;
}
