import 'package:film_place/home/home.dart';
import 'package:film_place/l10n/l10n.dart';
import 'package:film_place/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genre_repository/genre_repository.dart';
import 'package:movie_repository/movie_repository.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.movieRepository,
    required this.genreRepository,
  }) : super(key: key);

  final MovieRepository movieRepository;
  final GenreRepository genreRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<MovieRepository>(create: (_) => movieRepository),
        RepositoryProvider<GenreRepository>(create: (_) => genreRepository),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: FilmPlaceTheme.light,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const HomePage(),
    );
  }
}
