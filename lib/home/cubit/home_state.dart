part of 'home_cubit.dart';

enum HomeTab { movies, favorites }

class HomeState extends Equatable {
  const HomeState({
    this.tab = HomeTab.movies,
  });

  final HomeTab tab;

  HomeState copyWith({
    HomeTab? tab,
  }) {
    return HomeState(
      tab: tab ?? this.tab,
    );
  }

  @override
  List<Object?> get props => [tab];
}
