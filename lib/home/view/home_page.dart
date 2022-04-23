import 'package:film_place/favorites/view/favorites_page.dart';
import 'package:film_place/home/home.dart';
import 'package:film_place/l10n/l10n.dart';
import 'package:film_place/movies/view/view.dart';
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
      body: IndexedStack(
        index: selectedTab.index,
        children: const [MoviesPage(), FavoritesPage()],
      ),
      appBar: AppBar(
        elevation: 0,
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
        style: TextStyle(
          color: groupValue == value
              ? Theme.of(context).colorScheme.secondary
              : null,
          fontSize: 14,
        ),
      ),
      onTap: () => context.read<HomeCubit>().setTab(value),
    );
  }
}
