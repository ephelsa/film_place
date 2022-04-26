import 'package:film_place/favorites/favorites.dart';
import 'package:film_place/home/home.dart';
import 'package:film_place/l10n/l10n.dart';
import 'package:film_place/movies/movies.dart';
import 'package:film_place/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final selectedTab = context.select((HomeCubit cubit) => cubit.state.tab);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _HomeTabButton(
                  groupValue: selectedTab,
                  value: HomeTab.movies,
                  title: l10n.moviesHomeTabTitle,
                ),
                _HomeTabButton(
                  groupValue: selectedTab,
                  value: HomeTab.favorites,
                  title: l10n.favoritesHomeTabTitle,
                )
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: FilmPlaceSpace.small),
            sliver: SliverToBoxAdapter(
              child: IndexedStack(
                index: selectedTab.index,
                sizing: StackFit.expand,
                children: const [MoviesPage(), FavoritesPage()],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HomeTabButton extends StatelessWidget {
  const _HomeTabButton({
    Key? key,
    required this.groupValue,
    required this.value,
    required this.title,
  }) : super(key: key);

  final HomeTab groupValue;
  final HomeTab value;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: groupValue == value
                  ? Theme.of(context).colorScheme.secondary
                  : null,
            ),
      ),
      onTap: () => context.read<HomeCubit>().setTab(value),
    );
  }
}
