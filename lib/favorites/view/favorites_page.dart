import 'package:core_extensions/core_extensions.dart';
import 'package:core_ui/core_ui.dart';
import 'package:film_place/favorites/bloc/favorites_bloc.dart';
import 'package:film_place/favorites/favorites.dart';
import 'package:film_place/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_repository/movie_repository.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoritesBloc(
        movieRepository: context.read<MovieRepository>(),
      )..add(const FavoritesSubscriptionRequested()),
      child: const FavoritesView(),
    );
  }
}

class FavoritesView extends StatelessWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isPortrait = context.isPortrait;

    final nCards = isPortrait ? 3 : 2;
    final vPaddings = FilmPlaceSpace.medium * (nCards + 1);
    final cardHeight =
        (MediaQuery.of(context).size.height - vPaddings) / nCards;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: FilmPlaceSpace.medium),
      child: BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state) {
          final movies = state.movies;

          if (movies == null || movies.isEmpty) {
            if (state.status == FavoritesStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.status == FavoritesStatus.failure) {
              return const Center(
                child: FailureWidget(),
              );
            } else {
              return const Center(
                child: EmptyWidget(),
              );
            }
          }

          return Column(
            children: movies.map((movie) {
              return Padding(
                padding: const EdgeInsets.only(bottom: FilmPlaceSpace.medium),
                child: FavoriteCard(
                  height: cardHeight,
                  details: movie,
                  onDismissed: (_) => context
                      .read<FavoritesBloc>()
                      .add(FavoritesRemoved(movie.id)),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
