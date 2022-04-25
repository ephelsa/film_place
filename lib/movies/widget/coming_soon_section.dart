import 'package:core_extensions/core_extensions.dart';
import 'package:core_ui/core_ui.dart';
import 'package:film_place/l10n/l10n.dart';
import 'package:film_place/movie_details/movie_details.dart';
import 'package:film_place/movies/movies.dart';
import 'package:film_place/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComingSoonSection extends StatelessWidget {
  const ComingSoonSection({Key? key}) : super(key: key);

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
          BlocBuilder<ComingSoonBloc, ComingSoonState>(
            builder: (context, state) {
              final movies = state.moviesFiltered();

              if (movies == null || movies.isEmpty) {
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
                  itemCount: movies.length,
                  itemBuilder: (_, index) {
                    final movie = movies[index];

                    return Center(
                      child: ComingSoonCard(
                        width: cardWidth,
                        height: cardHeight,
                        title: movie.title,
                        imageUrl: movie.imagePath,
                        onPlayClick: () => context
                            .read<ComingSoonBloc>()
                            .add(ComingSoonPlayRequested(movie)),
                        onOpenClick: () => Navigator.of(context).push(
                          MovieDetailsPage.route(movieId: movie.id),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
