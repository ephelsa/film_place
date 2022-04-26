import 'package:core_ui/core_ui.dart';
import 'package:film_place/l10n/l10n.dart';
import 'package:film_place/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:genre_repository/genre_repository.dart';
import 'package:movie_repository/movie_repository.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({
    Key? key,
    required this.height,
    required this.details,
    required this.onDismissed,
  }) : super(key: key);

  final double height;

  final MovieDetails details;
  final DismissDirectionCallback onDismissed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dismissible(
      key: Key('favoriteCard_dismissible_${details.id}'),
      direction: DismissDirection.endToStart,
      onDismissed: onDismissed,
      background: Container(
        alignment: Alignment.centerRight,
        color: FilmPlaceColor.onyx.withOpacity(0.2),
        padding: const EdgeInsets.symmetric(
          horizontal: FilmPlaceSpace.mediumHigh,
        ),
        child: Icon(
          Icons.delete,
          color: theme.colorScheme.secondary,
        ),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: height,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                details.imagePath,
                cacheHeight: height.ceil(),
              ),
            ),
            const SizedBox(
              width: FilmPlaceSpace.small,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    details.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: theme.textTheme.headline3,
                    textAlign: TextAlign.center,
                  ),
                  _GenreList(details.genres),
                  _ClasificationAndVotes(
                    isAdult: details.isAdult,
                    voteAverage: details.votesAverage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ClasificationAndVotes extends StatelessWidget {
  const _ClasificationAndVotes({
    Key? key,
    required this.voteAverage,
    required this.isAdult,
  }) : super(key: key);

  final double voteAverage;
  final bool isAdult;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Row(
      children: [
        VotesWidget(
          voteAverage,
          size: 14,
          color: FilmPlaceColor.mustard,
        ),
        if (isAdult)
          Padding(
            padding: const EdgeInsets.only(
              right: FilmPlaceSpace.thinHigh,
            ),
            child: PillWidget(
              child: Text(l10n.plus18),
            ),
          ),
      ],
    );
  }
}

class _GenreList extends StatelessWidget {
  const _GenreList(this.genres, {Key? key}) : super(key: key);

  final List<Genre> genres;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: FilmPlaceSpace.small),
        child: Wrap(
          spacing: FilmPlaceSpace.thinHigh,
          runSpacing: FilmPlaceSpace.thinHigh,
          alignment: WrapAlignment.center,
          children: genres.map((genre) {
            return PillWidget(
              alignment: null,
              child: Text(genre.name),
            );
          }).toList(),
        ),
      ),
    );
  }
}
