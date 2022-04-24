class ImageProvider {
  const ImageProvider(this.path);

  final String path;

  String get fullPath => 'https://image.tmdb.org/t/p/original/$path';
}
