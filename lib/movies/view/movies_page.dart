import 'package:film_place/l10n/l10n.dart';
import 'package:film_place/movies/movies.dart';
import 'package:film_place/theme/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genre_repository/genre_repository.dart';
import 'package:movie_repository/movie_repository.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ComingSoonBloc(
            movieRepository: context.read<MovieRepository>(),
          )..add(const ComingSoonSubscriptionRequested()),
        ),
        BlocProvider(
          create: (context) => GenresBloc(
            genreRepository: context.read<GenreRepository>(),
          )..add(const GenresSubscriptionRequested()),
        ),
        BlocProvider(
          create: (context) =>
              TrendingNowBloc(movieRepository: context.read<MovieRepository>())
                ..add(const TrendingNowSubscriptionRequested()),
        )
      ],
      child: const MoviesView(),
    );
  }
}

class MoviesView extends StatelessWidget {
  const MoviesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return MultiBlocListener(
      listeners: [
        BlocListener<GenresBloc, GenresState>(
          listenWhen: (previous, current) =>
              current.status == GenresStatus.success &&
              previous.selectedGenre != current.selectedGenre,
          listener: (context, state) {
            context
                .read<ComingSoonBloc>()
                .add(ComingSoonFilterChanged(state.selectedGenre));
            context
                .read<TrendingNowBloc>()
                .add(TrendingNowFilterChanged(state.selectedGenre));
          },
        ),
        BlocListener<ComingSoonBloc, ComingSoonState>(
          listenWhen: (previous, current) =>
              current.status == ComingSoonStatus.success &&
              (current.currentMovieReproduced != null ||
                  previous.isPlayingMovie != current.isPlayingMovie),
          listener: (context, state) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  padding: EdgeInsets.zero,
                  duration: const Duration(seconds: 10),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network(
                        state.currentMovieReproduced!.imagePath,
                        width: 100,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      Flexible(
                        child: Text(
                          l10n.currentTrailerLabel(
                            state.currentMovieReproduced!.title,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: FilmPlaceSpace.medium,
                        ),
                        child: InkWell(
                          child: Icon(
                            state.isPlayingMovie
                                ? Icons.pause
                                : Icons.play_arrow,
                          ),
                          onTap: () {
                            context.read<ComingSoonBloc>().add(
                                  state.isPlayingMovie
                                      ? const ComingSoonPauseRequested()
                                      : ComingSoonPlayRequested(
                                          state.currentMovieReproduced!,
                                        ),
                                );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
          },
        ),
      ],
      child: Column(
        children: const [
          ComingSoonSection(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: FilmPlaceSpace.medium),
            child: GenresList(),
          ),
          TrendingNowSection(),
        ],
      ),
    );
  }
}
