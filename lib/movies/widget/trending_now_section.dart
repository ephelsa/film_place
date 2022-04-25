import 'package:core_extensions/core_extensions.dart';
import 'package:core_ui/core_ui.dart';
import 'package:film_place/l10n/l10n.dart';
import 'package:film_place/movies/movies.dart';
import 'package:film_place/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingNowSection extends StatelessWidget {
  const TrendingNowSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isPortrait = context.isPortrait;

    final nCards = isPortrait ? 2 : 3;
    final spaceBetweenCards = nCards + 1;
    final hPadding = FilmPlaceSpace.medium * spaceBetweenCards;
    final cardAspectRatio = isPortrait ? 0.9 : 1.6;
    final cardWidth = (MediaQuery.of(context).size.width - hPadding) / nCards;
    final cardHeight = context.heightAspectRatio(
      cardAspectRatio,
      modifiers: -hPadding,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: FilmPlaceSpace.medium,
            right: FilmPlaceSpace.medium,
            bottom: FilmPlaceSpace.medium,
          ),
          child: Text(
            l10n.trendingNowSectionLabel,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        BlocBuilder<TrendingNowBloc, TrendingNowState>(
          builder: (context, state) {
            final movies = state.moviesFiltered();

            if (movies == null || movies.isEmpty) {
              if (state.status == TrendingNowStatus.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.status == TrendingNowStatus.failure) {
                return FailureWidget(
                  height: cardHeight,
                );
              } else {
                return EmptyWidget(
                  height: cardHeight,
                );
              }
            }

            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: cardHeight,
              child: Center(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: movies.length,
                  separatorBuilder: (_, __) => const SizedBox(
                    width: FilmPlaceSpace.medium,
                  ),
                  itemBuilder: (context, index) {
                    final movie = movies[index];

                    return TrendingNowCard(
                      width: cardWidth,
                      height: cardHeight,
                      imageUrl: movie.imagePath,
                      isAdult: movie.isAdult,
                      genres: movie.genres,
                      voteAverage: movie.votesAverage,
                      title: movie.title,
                    );
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
