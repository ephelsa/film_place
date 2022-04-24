import 'package:dio/dio.dart';

/// HTTP client with default configurations for TheMoviesDB.
class TMDBClient {
  const TMDBClient._();

  /// HTTP client with a basic configuration.
  static Dio client(String language, String apiKey) {
    final options = BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: <String, dynamic>{
        'api_key': apiKey,
        'language': language,
      },
    );
    final dio = Dio(options);

    dio.interceptors.add(LogInterceptor(responseBody: true));

    return dio;
  }
}
