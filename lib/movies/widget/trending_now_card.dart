import 'package:core_ui/core_ui.dart';
import 'package:film_place/l10n/l10n.dart';
import 'package:film_place/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:genre_repository/genre_repository.dart';

class TrendingNowCard extends StatelessWidget {
  const TrendingNowCard({
    Key? key,
    required this.width,
    required this.height,
    required this.imageUrl,
    required this.isAdult,
    required this.genres,
    required this.voteAverage,
    required this.title,
    required this.onClick,
  }) : super(key: key);

  final double width;
  final double height;
  final String imageUrl;
  final bool isAdult;
  final List<Genre> genres;
  final double voteAverage;
  final String title;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    final imageHeight = height * 0.75;

    return SizedBox(
      width: width,
      height: height,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              onTap: onClick,
              child: Image.network(
                imageUrl,
                height: imageHeight,
                width: width,
                cacheHeight: imageHeight.toInt(),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: FilmPlaceSpace.small,
            ),
            child: _TagList(
              width: width,
              isAdult: isAdult,
              genres: genres,
              voteAverage: voteAverage,
            ),
          ),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }
}

class _TagList extends StatelessWidget {
  const _TagList({
    Key? key,
    required this.width,
    required this.isAdult,
    required this.genres,
    required this.voteAverage,
  }) : super(key: key);

  final double width;
  final bool isAdult;
  final List<Genre> genres;
  final double voteAverage;

  double get _hSpace => FilmPlaceSpace.thinHigh;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return SizedBox(
      height: 35,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          if (isAdult)
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: _hSpace,
              ),
              child: PillWidget(
                child: Text(l10n.plus18),
              ),
            ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _hSpace),
            child: VotesWidget(
              voteAverage,
              size: 14,
              color: FilmPlaceColor.mustard,
            ),
          ),
          // Genres
          ...genres.map((genre) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: _hSpace,
              ),
              child: PillWidget(child: Text(genre.name)),
            );
          }).toList(),
        ],
      ),
    );
  }
}
