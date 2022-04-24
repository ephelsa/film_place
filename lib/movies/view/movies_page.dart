import 'package:core_extensions/core_extensions.dart';
import 'package:core_ui/core_ui.dart';
import 'package:film_place/l10n/l10n.dart';
import 'package:film_place/movies/movies.dart';
import 'package:film_place/theme/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      ],
      child: const MoviesView(),
    );
  }
}

class MoviesView extends StatelessWidget {
  const MoviesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      child: ListView(
        children: const [
          _ComingSoonSection(),
          _TrendingNowSection(),
        ],
      ),
    );
  }
}

class _ComingSoonSection extends StatelessWidget {
  const _ComingSoonSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    const hPaddings = FilmPlaceSpace.medium * 2;
    final cardWidth = MediaQuery.of(context).size.width - hPaddings;
    final cardHeight = context.heightAspectRatio(
      8 / 5,
      modifiers: -hPaddings,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: hPaddings / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.comingSoonSectionLabel,
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(
            height: FilmPlaceSpace.medium,
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
            child: BlocBuilder<ComingSoonBloc, ComingSoonState>(
              builder: (context, state) {
                if (state.movies == null || state.movies?.isEmpty == true) {
                  if (state.status == ComingSoonStatus.loading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state.status == ComingSoonStatus.failure) {
                    return Center(
                      child: FailureWidget(
                        height: cardHeight,
                        onTap: () => context
                            .read<ComingSoonBloc>()
                            .add(const ComingSoonRetryRequested()),
                      ),
                    );
                  } else {
                    return Center(
                      child: EmptyWidget(
                        height: cardHeight,
                      ),
                    );
                  }
                }

                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: cardHeight,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (_, __) => const SizedBox(
                      width: FilmPlaceSpace.medium,
                    ),
                    itemCount: state.movies!.length,
                    itemBuilder: (_, index) {
                      final movie = state.movies![index];

                      return Center(
                        child: ComingSoonCard(
                          width: cardWidth,
                          height: cardHeight,
                          title: movie.title,
                          imageUrl: movie.imagePath,
                          onPlayClick: () => context
                              .read<ComingSoonBloc>()
                              .add(ComingSoonPlayRequested(movie)),
                          onOpenClick: () {
                            /// TODO
                          },
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _TrendingNowSection extends StatelessWidget {
  const _TrendingNowSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: const Text('Trending Now section'),
    );
  }
}
