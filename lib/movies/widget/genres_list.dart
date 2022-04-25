import 'package:core_ui/core_ui.dart';
import 'package:film_place/movies/bloc/genres_bloc.dart';
import 'package:film_place/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenresList extends StatelessWidget {
  const GenresList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const height = 35.0;

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: height,
      child: BlocBuilder<GenresBloc, GenresState>(
        builder: (context, state) {
          if (state.genres == null || state.genres?.isEmpty == true) {
            if (state.status == GenresStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.status == GenresStatus.failure) {
              return const FailureWidget(
                height: height,
              );
            } else {
              return const EmptyWidget(
                height: height,
              );
            }
          }

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.genres!.length,
            itemBuilder: (_, index) {
              final genre = state.genres![index];

              return Padding(
                padding: EdgeInsets.only(
                  left: FilmPlaceSpace.medium,
                  right: index == state.genres!.length - 1
                      ? FilmPlaceSpace.medium
                      : 0,
                ),
                child: InkWell(
                  child: PillWidget(
                    color: state.isSelected(genre)
                        ? Theme.of(context).colorScheme.secondary
                        : null,
                    child: Text(
                      genre.name,
                      style: FilmPlaceTypography.tagTextStyle,
                    ),
                  ),
                  onTap: () => context
                      .read<GenresBloc>()
                      .add(GenresFilterChanged(genre)),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
