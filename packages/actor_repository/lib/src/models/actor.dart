import 'package:equatable/equatable.dart';
import 'package:the_movie_db_api/the_movie_db_api.dart';

class Actor extends Equatable {
  const Actor({
    required this.id,
    required this.name,
    required this.imagePath,
  });

  factory Actor.fromActorRemote(ActorRemote remote) {
    return Actor(
      id: remote.id,
      name: remote.name,
      imagePath: remote.profilePath,
    );
  }

  final int id;
  final String name;
  final String imagePath;

  @override
  List<Object?> get props => [
        id,
        name,
        imagePath,
      ];
}
