import 'package:film_place/favorites/bloc/favorite_button_bloc.dart';
import 'package:film_place/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_repository/movie_repository.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton(this.movieId, {Key? key}) : super(key: key);

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteButtonBloc(
        movieId,
        movieRepository: context.read<MovieRepository>(),
      )..add(const FavoriteButtonSubscriptionRequested()),
      child: BlocBuilder<FavoriteButtonBloc, FavoriteButtonState>(
        builder: (context, state) {
          return _FavoriteButtonView(
            isLoading: state.status == FavoriteButtonStatus.loading,
            isFavorite: state.isFavorite,
          );
        },
      ),
    );
  }
}

class _FavoriteButtonView extends StatelessWidget {
  const _FavoriteButtonView({
    Key? key,
    required this.isFavorite,
    required this.isLoading,
  }) : super(key: key);

  final bool isLoading;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: GestureDetector(
        onTap: _handleOnTap(context),
        child: Icon(
          Icons.favorite,
          color: isFavorite
              ? FilmPlaceColor.imperialRed
              : FilmPlaceColor.raisingBlack,
        ),
      ),
    );
  }

  VoidCallback? _handleOnTap(BuildContext context) {
    if (isLoading) return null;

    return () {
      context.read<FavoriteButtonBloc>().add(
            isFavorite
                ? const FavoriteButtonRemoved()
                : const FavoriteButtonAdded(),
          );
    };
  }
}
